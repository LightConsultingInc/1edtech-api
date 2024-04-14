import { Module, OnApplicationShutdown } from '@nestjs/common';
import { DatabaseService } from './database.service';
import { APP_INTERCEPTOR, ModuleRef } from '@nestjs/core';
import { DatabaseConnection } from './database.connection';
import { TransactionInterceptor } from './transaction.interceptor';

@Module({
  imports: [],
  providers: [
    DatabaseService,
    {
      provide: DatabaseConnection,
      useFactory: (dbService: DatabaseService) => {
        return dbService.getConnection();
      },
      inject: [DatabaseService],
    },
    {
      provide: APP_INTERCEPTOR,
      useClass: TransactionInterceptor,
    },
  ],
  exports: [DatabaseConnection, DatabaseService],
})
export class DatabaseModule implements OnApplicationShutdown {
  constructor(private readonly moduleRef: ModuleRef) {}

  public async onApplicationShutdown(_signal?: string) {
    const dbService = await this.moduleRef.resolve(DatabaseService);
    await dbService.rollback();
    dbService.closeConnection();
  }
}
