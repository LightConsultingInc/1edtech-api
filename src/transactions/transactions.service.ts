import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { TransactionsRepository } from './transactions.repository';
import { Account, AccountsRepository } from 'src/accounts/accounts.repository';
import { TransactionReason } from './transactions.types';
import {
  RewardLevel,
  RewardLevelsRepository,
} from 'src/rewards/rewardLevels.repository';

import { RewardsRepository } from 'src/rewards/rewards.repository';

@Injectable()
export class TransactionsService {
  constructor(
    private readonly transactionsRepository: TransactionsRepository,
    private readonly accountsRepository: AccountsRepository,
    private readonly rewardLevelsRepository: RewardLevelsRepository,
    private readonly rewardsRepository: RewardsRepository, 
  ) {}

  async create(
    account: Account,
    value: number,
    type: TransactionReason,
    rewardLevelId?: number,
  ) {
    const [transaction] = await this.transactionsRepository
      .create({
        accountId: account.id,
        amountInPoints: value,
        type,
        rewardLevelId,
      })
      .returning('*');

    return transaction;
  }

  async list(email: string) {
    const account = await this.accountsRepository.getByEmail(email);

    if (!account) throw new NotFoundException('Account not found');

    const transactions =
      await this.transactionsRepository.getTransactionsByAccountId(account.id);

    return await Promise.all(
      transactions.map(async (transaction) => ({
        ...transaction,
        balance: await this.getBalanceForAccount(
          account,
          transaction.createdAt,
        ),
        vendor: await this.getVendorNameByRewardLevelId(
          transaction.rewardLevelId,
        ),
      })),
    );
  }

  async getVendorNameByRewardLevelId(
    rewardLevelId: number,
  ): Promise<string | undefined> {
    if (rewardLevelId === undefined) return undefined;

    const rewardLevel = await this.rewardLevelsRepository.get(rewardLevelId);
    if (!rewardLevel) return undefined;
    const vendorName = await this.rewardsRepository.get(rewardLevel?.rewardId);
    return vendorName?.name;
  }

  async getBalanceForAccount(account: Account, atTime?: Date) {
    const transactions =
      await this.transactionsRepository.getTransactionsByAccountId(
        account.id,
        atTime,
      );

    const balance = transactions.reduce(
      (acc, transaction) => acc + transaction.amountInPoints,
      0,
    );

    return balance;
  }

  async redeem(account: Account, level: RewardLevel) {
    const balance = await this.getBalanceForAccount(account);

    const value = level.amountInPoints;

    if (balance < value) throw new BadRequestException('Insufficient balance');

    const transaction = await this.create(
      account,
      -value,
      TransactionReason.REDEMPTION,
      level.id,
    );

    return { ...transaction, redemptionLink: '' };
  }

  async updateRedemptionLink(transactionId: number, link: string) {
    const [transaction] = await this.transactionsRepository
      .update(transactionId, {
        redemptionLink: link,
      })
      .returning('*');
    return transaction;
  }
}
