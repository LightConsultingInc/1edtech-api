import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Observable } from 'rxjs';
import {
  TRANSACTION_INTERCEPTOR_CONFIG,
  TransactionInterceptorConfig,
} from './database.decorators';
import { DatabaseService } from './database.service';

const WRITE_METHODS = ['POST', 'PUT', 'PATCH', 'DELETE'];

@Injectable()
export class TransactionInterceptor implements NestInterceptor {
  constructor(
    private readonly reflector: Reflector,
    private readonly databaseService: DatabaseService,
  ) {}

  intercept(context: ExecutionContext, next: CallHandler) {
    // GUARD: return early if we are a read http method
    const request = context.switchToHttp().getRequest();
    if (!WRITE_METHODS.includes(request?.method)) {
      return next.handle();
    }

    // GUARD: return early if @DisableTransactions() is set
    const config =
      this.reflector.get<TransactionInterceptorConfig>(
        TRANSACTION_INTERCEPTOR_CONFIG,
        context.getHandler(),
      ) ??
      this.reflector.get<TransactionInterceptorConfig>(
        TRANSACTION_INTERCEPTOR_CONFIG,
        context.getClass(),
      );
    if (config?.disabled) {
      return next.handle();
    }

    // We are going to execute in a transaction scope.
    // NestJS uses rxjs observables to do request handling, but AsyncLocalStorage
    // requires that things be in promises. So, we must wrap the CallHandler observable
    // in a promise so that the AsyncLocalStorage can provide context. THEN, we have to
    // wrap the returned promise in an Observable so that the intercept call can return
    // an observable like NestJS expects.
    // (╯°□°)╯︵ ┻━┻
    return new Observable((subscribe) => {
      this.databaseService.withAmbientTransaction(() =>
        // wrap the CallHandler observable in a promise
        new Promise<void>((resolve, reject) => {
          next.handle().subscribe({
            next: (result) => {
              resolve(result);
            },
            error: (error) => {
              reject(error);
            },
          });
        })
          .then((result) => {
            subscribe.next(result);
            subscribe.complete();
          })
          .catch((error) => {
            subscribe.error(error);
          }),
      );
    });
  }
}
