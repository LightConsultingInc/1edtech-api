import { Module } from '@nestjs/common';
import { DatabaseModule } from 'src/database/database.module';
import { TransactionsService } from './transactions.service';
import { TransactionsRepository } from './transactions.repository';
import { TransactionsController } from './transactions.controller';
import { AccountsRepository } from 'src/accounts/accounts.repository';
import { RewardLevelsRepository } from 'src/rewards/rewardLevels.repository';
import { RewardsRepository } from 'src/rewards/rewards.repository';

@Module({
  imports: [DatabaseModule],
  providers: [
    TransactionsRepository,
    AccountsRepository,
    TransactionsService,
    RewardLevelsRepository,
    RewardsRepository,
  ],
  controllers: [TransactionsController],
  exports: [TransactionsService],
})
export class TransactionsModule {}
