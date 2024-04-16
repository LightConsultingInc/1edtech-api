import { Knex } from 'knex';

export interface TraceableTransaction {
  id: string;
  trx?: Knex.Transaction;
}
