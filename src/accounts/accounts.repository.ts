import { DatabaseRepository } from 'src/database/database.repository';

export interface Account {
  id: number;

  email: string;
}

export class AccountsRepository extends DatabaseRepository<Account> {
  tableName = 'accounts';

  async getByEmail(email: string) {
    return await this.db
      .select('*')
      .from(this.tableName)
      .where({ email })
      .first();
  }
}
