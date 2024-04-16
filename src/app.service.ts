import { Injectable } from '@nestjs/common';
import { version } from '../package.json';

@Injectable()
export class AppService {
  async getHello(): Promise<string> {
    return `Rewards version: ${version}`;
  }
}
