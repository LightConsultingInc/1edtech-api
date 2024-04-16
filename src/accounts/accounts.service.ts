import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { TransactionsService } from 'src/transactions/transactions.service';
import { Account, AccountsRepository } from './accounts.repository';
import { TransactionReason } from 'src/transactions/transactions.types';

@Injectable()
export class AccountsService {
  constructor(
    private readonly accountsRepository: AccountsRepository,
    private readonly transactionsService: TransactionsService,
  ) {}

  async create(email: string, initialBalance: number) {
    try {
      const [account] = await this.accountsRepository
        .create({ email })
        .returning('*');

      await this.transactionsService.create(
        account,
        initialBalance,
        TransactionReason.INITIAL,
      );

      const balance =
        await this.transactionsService.getBalanceForAccount(account);

      return { ...account, balance };
    } catch (error) {
      if (error.message.includes('duplicate')) {
        throw new BadRequestException('Account already exists');
      }

      throw error;
    }
  }

  async get(email: string): Promise<Account & { balance: number }> {
    const account = await this.accountsRepository.getByEmail(email);

    if (!account) throw new NotFoundException('Account not found');

    const balance =
      await this.transactionsService.getBalanceForAccount(account);

    return { ...account, balance };
  }

  async addPoints(account: Account, amount: number, reason: TransactionReason) {
    return await this.transactionsService.create(account, amount, reason);
  }
}
