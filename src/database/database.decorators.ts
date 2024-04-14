import { Inject, SetMetadata } from '@nestjs/common';
import { DatabaseService } from './database.service';
import { DatabaseConnection } from './database.connection';

export const TRANSACTION_INTERCEPTOR_CONFIG = Symbol(
  'TRANSACTION_INTERCEPTOR_CONFIG',
);

export function InjectDatabase() {
  return Inject(DatabaseConnection) as ParameterDecorator;
}

export const DisableTransactions = () =>
  SetMetadata(TRANSACTION_INTERCEPTOR_CONFIG, { disabled: true });

export interface TransactionInterceptorConfig {
  disabled?: boolean;
}

export function Transaction() {
  const injectDatabase = Inject(DatabaseService);
  return function (
    target: any,
    _propertyKey: string,
    descriptor: PropertyDescriptor,
  ) {
    injectDatabase(target, 'database');
    const value = descriptor.value;
    descriptor.value = async function (...args: any[]) {
      const database: DatabaseService = (this as any).database;
      return database.withAmbientTransaction(() => value.apply(this, args));
    };
  };
}
