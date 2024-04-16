import { Injectable } from '@nestjs/common';
import { Knex } from 'knex';
import { InjectDatabase } from './database.decorators';

export interface DatabaseRepository<T> {
  tableName: string;
  get(id: number): Promise<T>;
  update(id: string | number, data: Partial<T>): Knex.QueryBuilder<T>;
  create(data: Partial<T>): Knex.QueryBuilder<T>;
  delete(id: number | Partial<T>): Knex.QueryBuilder<T>;
  upsert(data: Partial<T>, onConflictField: string): Knex.QueryBuilder<T>;
}

@Injectable()
export abstract class DatabaseRepository<T extends object> {
  constructor(@InjectDatabase() protected readonly db: Knex) {}

  async get(id: number): Promise<T> {
    const [record] = await this.db(this.tableName)
      .where('id', '=', id)
      .select('*');
    return record as unknown as T;
  }

  async list(): Promise<T[]> {
    const records = await this.db(this.tableName).select('*');
    return records as unknown as T[];
  }

  update(id: string | number, data: Partial<T>): Knex.QueryBuilder<T> {
    const record = this.db(this.tableName).where({ id: id }).update(data);
    return record;
  }

  create(data: Partial<T>): Knex.QueryBuilder<T> {
    const record = this.db(this.tableName).insert(data);
    return record;
  }

  upsert(data: Partial<T>, onConflictField): Knex.QueryBuilder<T> {
    const record = this.db(this.tableName)
      .insert(data)
      .onConflict(onConflictField)
      .merge();

    return record;
  }
  delete(id: number | Partial<T>): Knex.QueryBuilder<T> {
    if (typeof id !== 'number') {
      const deletion = this.db(this.tableName).where(id).delete();
      return deletion;
    } else {
      const deletion = this.db(this.tableName).where({ id: id }).delete();
      return deletion;
    }
  }
}
