import type { Knex } from 'knex';
import * as fs from 'fs';

export async function up(knex: Knex): Promise<void> {
  const file = fs.readFileSync(__dirname + '/schema/cat-qti.sql', 'utf-8');

  await knex.schema.raw(file);

  const core = fs.readFileSync(__dirname + '/schema/core-qti.sql', 'utf-8');

  await knex.schema.raw(core);
}

export async function down(knex: Knex): Promise<void> {}
