import { DatabaseRepository } from 'src/database/database.repository';

export interface RewardAccount {
  rewardId: number;

  accountId: number;
}

export class RewardAccountsRepository extends DatabaseRepository<RewardAccount> {
  tableName = 'rewardAccounts';

  async getByAccountId(accountId: number): Promise<RewardAccount[]> {
    const record = await this.db(this.tableName)
      .where({ accountId })
      .select('*');

    return record as unknown as RewardAccount[];
  }
}
