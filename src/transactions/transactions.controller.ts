import { Controller, Get, Param } from '@nestjs/common';
import { TransactionsService } from './transactions.service';

@Controller('transactions')
export class TransactionsController {
  constructor(private readonly transactionsService: TransactionsService) {}

  @Get(':email')
  async get(@Param('email') email: string) {
    return await this.transactionsService.list(email);
  }
}
