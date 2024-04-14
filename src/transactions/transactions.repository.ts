import { DatabaseRepository } from 'src/database/database.repository';
import { TransactionReason } from './transactions.types';

export interface Transaction {
  id: number;

  rewardLevelId: number;

  accountId: number;

  amountInPoints: number;

  createdAt: Date;

  redemptionLink: string;

  type: TransactionReason;
}

export class TransactionsRepository extends DatabaseRepository<Transaction> {
  tableName = 'transactions';

  async getTransactionsByAccountId(
    accountId: number,
    before: Date = new Date(),
  ): Promise<Transaction[]> {
    // Datetime precision is not exact, so we add a 1 second buffer to the date
    before.setSeconds(before.getSeconds() + 1);
    return await this.db(this.tableName)
      .select('*')
      .where({ accountId })
      .where('createdAt', '<=', before)
      .orderBy('createdAt', 'asc');
  }
}
