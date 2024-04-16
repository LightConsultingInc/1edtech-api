import {
  BadRequestException,
  Body,
  Controller,
  Get,
  NotFoundException,
  Param,
  Post,
  Query,
} from '@nestjs/common';
import { AccountsService } from './accounts.service';
import { TransactionReason } from 'src/transactions/transactions.types';

@Controller('accounts')
export class AccountsController {
  constructor(private readonly accountsService: AccountsService) {}

  @Post()
  async create(
    @Body('email') email: string,
    @Body('initialBalance') initialBalance: number,
  ) {
    return await this.accountsService.create(email, initialBalance);
  }

  @Get(':email')
  async get(@Param('email') email: string) {
    return await this.accountsService.get(email);
  }

  @Post(':email')
  async addPoints(
    @Body('additionalBalance') additionalBalance: number,
    @Body('reason') reason: TransactionReason,
    @Param('email') email: string,
  ) {
    const account = await this.accountsService.get(email);

    if (!account) throw new NotFoundException('Account not found');

    if (!Object.values(TransactionReason).includes(reason))
      throw new BadRequestException('Invalid reason');

    return await this.accountsService.addPoints(
      account,
      additionalBalance,
      reason,
    );
  }
}
