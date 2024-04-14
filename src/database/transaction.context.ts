import { AsyncLocalStorage } from 'async_hooks';
import { randomUUID } from 'crypto';
import { Knex } from 'knex';
import { TraceableTransaction } from './traceable.transaction';

export class TransactionContext extends AsyncLocalStorage<TraceableTransaction> {
  public getContext(trx: Knex.Transaction): TraceableTransaction {
    const id = randomUUID();
    const context = {
      id,
      trx,
    };
    return context;
  }
}
