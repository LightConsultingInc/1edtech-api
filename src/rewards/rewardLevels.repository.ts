import { DatabaseRepository } from 'src/database/database.repository';

export interface RewardLevel {
  id: number;

  rewardId: number;

  amountInCentsUSD: number;

  amountInPoints: number;
}

export class RewardLevelsRepository extends DatabaseRepository<RewardLevel> {
  tableName = 'rewardLevels';

  async getByRewardId(rewardId: number): Promise<RewardLevel[]> {
    const records = await this.db(this.tableName)
      .where({ rewardId })
      .select('*');
    return records as unknown as RewardLevel[];
  }
}
