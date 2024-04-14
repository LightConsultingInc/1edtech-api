import { DatabaseRepository } from 'src/database/database.repository';

export interface Rewards {
  id: number;

  name: string;

  imageUrl: string;

  externalCode: string;
}

export class RewardsRepository extends DatabaseRepository<Rewards> {
  tableName = 'rewards';
}
