import type { Knex } from 'knex';
import * as fs from 'fs';

export async function up(knex: Knex): Promise<void> {
  const file = fs.readFileSync(__dirname + '/schema/oneroster.sql', 'utf-8');

  await knex.schema.raw(file);
}

export async function down(knex: Knex): Promise<void> {}
