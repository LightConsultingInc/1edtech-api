import { Module } from '@nestjs/common';
import { DatabaseModule } from 'src/database/database.module';
import { AccountsController } from './accounts.controller';
import { AccountsService } from './accounts.service';
import { TransactionsModule } from 'src/transactions/transactions.module';
import { AccountsRepository } from './accounts.repository';

@Module({
  imports: [DatabaseModule, TransactionsModule],
  providers: [AccountsRepository, AccountsService],
  controllers: [AccountsController],
  exports: [AccountsService],
})
export class AccountsModule {}
