import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common';
import { RewardsService } from './rewards.service';

@Controller('rewards')
export class RewardsController {
  constructor(private readonly rewardsService: RewardsService) {}

  @Get()
  async getAvailableRewards(@Query('email') email?: string) {
    return await this.rewardsService.getAvailableRewards(email);
  }

  @Get('import')
  async importRewards() {
    return await this.rewardsService.import();
  }

  @Post(':email')
  async redemption(@Param('email') email: string, @Body('sku') sku: string) {
    return await this.rewardsService.redeem(email, sku);
  }
}
