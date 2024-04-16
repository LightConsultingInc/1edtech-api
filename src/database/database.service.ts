import knex, { Knex } from 'knex';
import { TransactionContext } from './transaction.context';
import * as FunctionHelper from 'knex/lib/knex-builder/FunctionHelper.js';

export class DatabaseService {
  private globalTransaction: Knex.TransactionProvider | null = null;
  private connection: Knex | null = null;
  private transactionContext: TransactionContext = new TransactionContext();
  public transactionCount = 0;
  public transactedQueryCount = 0;
  public committedCount = 0;
  public rolledBackCount = 0;

  private knexProxy = (knex: Knex) => {
    const wrapper = (
      tableName: Knex.TableDescriptor | Knex.AliasDict,
      opts: any,
    ) => {
      const transaction = this.transactionContext.getStore();
      if (transaction?.trx) {
        this.transactedQueryCount++;
      }
      const fn = transaction?.trx ?? knex;
      return fn.apply(knex, [tableName, opts]);
    };
    // we need to alias this for use in the queryBuilder function, queryBuilder must maintain this
    // in thie scope of the knex object, not the scope of the databaser service.
    // eslint-disable-next-line @typescript-eslint/no-this-alias
    const self = this;
    const v = Object.assign(wrapper, knex, {
      fn: new FunctionHelper(knex.client),
      raw: function (...args) {
        return (knex as any).context.raw(...args);
      },
      queryBuilder() {
        const transaction = self.transactionContext.getStore();
        if (transaction?.trx) {
          self.transactedQueryCount++;
          return transaction.trx.queryBuilder();
        }
        return (knex as any).queryBuilder();
      },
    });
    return v;
  };

  /***
   * Sets the ambient transaction for the current request and returns the transaction
   * so that the calling function can control it. If there is already an ambient transaction,
   * then it returns the transaction id as another calling function already has control over
   * the ambient transaction, but the id is still useful for diagnostics.
   */
  public async withAmbientTransaction<T>(func: () => T): Promise<T> {
    const existingTrx = this.transactionContext.getStore();
    if (existingTrx) {
      console.debug(`Enrolled in existing transaction ${existingTrx.id}`);
      return func();
    }

    // this should never happen, but we check just in case
    if (!this.connection) {
      throw new Error(
        'No connection when attempting to start ambient transaction.',
      );
    }

    // if there's a global transaction, use it
    let trx;
    if (this.globalTransaction) {
      trx = await this.globalTransaction();
    } else {
      trx = await this.connection.transaction();
    }
    const context = this.transactionContext.getContext(trx);
    console.debug(`Provided transaction ${context.id}`);
    this.transactionCount++;
    try {
      const result = await this.transactionContext.run(context, func);
      await trx.commit();
      return result;
    } catch (e) {
      await trx.rollback();
      throw e;
    }
  }

  public async getConnection(): Promise<Knex> {
    // if we have a transaction provider, we are in test mode
    // return the ambient transaction
    if (this.connection === null) {
      const knexfile = await import('../../knexfile');
      const env = process.env.NODE_ENV ?? 'development';
      if (!knexfile[env]) {
        throw new Error(`Invalid environment [${env}] for db`);
      }
      const options = knexfile[env];
      this.connection = knex({
        ...options,
        connection: {
          uri: options.connection,
          multipleStatements: true,
        },
      });
    }

    if (process.env.NODE_ENV === 'test') {
      if (this.globalTransaction === null) {
        this.globalTransaction = await this.connection.transactionProvider();
        const trx = await this.globalTransaction();
        this.rollback = trx.rollback;
        trx.rollback = (): any => {
          this.rolledBackCount++;
        };
        trx.commit = (): any => {
          this.committedCount++;
        };
      }
    }
    return this.knexProxy(
      this.globalTransaction ? await this.globalTransaction() : this.connection,
    );
  }

  // This method does nothing under normal circumstances, but in test mode, it
  // gets overridden to provide rollback functionality.
  public async rollback(): Promise<any> {}

  public async closeConnection() {
    if (this.connection !== null) {
      await this.connection.destroy();
    }
  }
}
