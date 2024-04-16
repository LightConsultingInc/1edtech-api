import { Module } from '@nestjs/common';
import { DatabaseModule } from 'src/database/database.module';
import { RewardLevelsRepository } from './rewardLevels.repository';
import { RewardsRepository } from './rewards.repository';
import { RewardsService } from './rewards.service';
import { RewardsController } from './rewards.controller';
import { RewardAccountsRepository } from './rewardAccounts.repository';
import { AccountsModule } from 'src/accounts/accounts.module';
import { TransactionsModule } from 'src/transactions/transactions.module';

@Module({
  imports: [DatabaseModule, AccountsModule, TransactionsModule],
  providers: [
    RewardAccountsRepository,
    RewardLevelsRepository,
    RewardsRepository,
    RewardsService,
  ],
  controllers: [RewardsController],
})
export class RewardsModule {}
