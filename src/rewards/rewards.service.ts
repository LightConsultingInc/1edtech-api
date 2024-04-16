import { Injectable, NotFoundException } from '@nestjs/common';
import { RewardLevel, RewardLevelsRepository } from './rewardLevels.repository';
import { Rewards, RewardsRepository } from './rewards.repository';
import { RewardAccountsRepository } from './rewardAccounts.repository';
import { AccountsService } from 'src/accounts/accounts.service';
import { TransactionsService } from 'src/transactions/transactions.service';
import { GiftBitApi } from 'src/giftbit/giftbit.base';
import { GiftBitClient } from 'src/giftbit/giftbit.client';

@Injectable()
export class RewardsService {
  private readonly giftBitApi: GiftBitApi;

  constructor(
    private readonly rewardsRepository: RewardsRepository,
    private readonly rewardLevelsRepository: RewardLevelsRepository,
    private readonly rewardAccountsRepository: RewardAccountsRepository,
    private readonly accountsService: AccountsService,
    private readonly transactionsService: TransactionsService,
  ) {
    this.giftBitApi = GiftBitClient();
  }

  async getAvailableRewards(email?: string) {
    const availableRewards: (Rewards & {
      levels: (RewardLevel & { sku: string })[];
    })[] = [];
    const rewards = await this.rewardsRepository.list();

    for (const reward of rewards) {
      const levels = await this.rewardLevelsRepository.getByRewardId(reward.id);

      const levelsWithSku = levels.map((level) => ({
        ...level,
        sku: `${reward.name.replaceAll(' ', '_').toUpperCase()}_${
          level.amountInPoints
        }_${reward.id}_${level.id}`,
      }));

      availableRewards.push({
        ...reward,
        levels: levelsWithSku,
      });
    }

    if (email) {
      const account = await this.accountsService.get(email);

      const rewardAccounts = await this.rewardAccountsRepository.getByAccountId(
        account.id,
      );

      return availableRewards.filter((reward) => {
        const rewardAccount = rewardAccounts.find(
          (ra) => ra.rewardId === reward.id,
        );

        if (rewardAccount) return reward;
        else return undefined;
      });
    }

    return availableRewards;
  }

  async redeem(email: string, sku: string) {
    const allowedRewards = await this.getAvailableRewards();

    const reward = allowedRewards.find((r) =>
      r.levels.find((l) => l.sku === sku),
    );

    if (!reward)
      throw new NotFoundException(`Reward with sku ${sku} not found`);

    const level = reward.levels.find((l) => l.sku === sku);

    const account = await this.accountsService.get(email);

    let transaction = await this.transactionsService.redeem(account, level);

    const link = await this.giftBitApi.redeemGiftCard(
      reward.externalCode,
      String(transaction.id),
      level.amountInCentsUSD,
    );

    transaction = await this.transactionsService.updateRedemptionLink(
      transaction.id,
      link,
    );

    return transaction;
  }

  async import() {
    const brands = await this.giftBitApi.listBrands();

    await Promise.all(
      brands.brands.map(async (brand) => {
        const importedBrand = (await this.giftBitApi.getBrand(brand.brand_code))
          .brand;

        if (importedBrand.embeddable) {
          const [reward] = await this.rewardsRepository
            .upsert(
              {
                name: importedBrand.name,
                imageUrl: importedBrand.image_url,
                externalCode: importedBrand.brand_code,
              },
              'name',
            )
            .returning('*');

          if (importedBrand.variable_price) {
            const min = importedBrand.min_price_in_cents;
            const max = importedBrand.max_price_in_cents;

            for (let i = min; i <= max; i += 500) {
              await this.rewardLevelsRepository.upsert(
                {
                  rewardId: reward.id,
                  amountInPoints: i,
                  amountInCentsUSD: i,
                },
                ['rewardId', 'amountInPoints'],
              );
            }
          } else {
            for (const price of importedBrand.allowed_prices_in_cents) {
              await this.rewardLevelsRepository.upsert(
                {
                  rewardId: reward.id,
                  amountInPoints: price,
                  amountInCentsUSD: price,
                },
                ['rewardId', 'amountInPoints'],
              );
            }
          }
        }
      }),
    );
  }
}
