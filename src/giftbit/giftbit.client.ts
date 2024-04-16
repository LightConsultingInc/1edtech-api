import { Configuration } from 'src/api.base';
import { GiftBitApi } from './giftbit.base';

export const GiftBitClient = () => {
  const config = new Configuration(
    process.env.REWARDS_API_URL,
    process.env.REWARDS_API_KEY,
    'Bearer',
  );

  return new GiftBitApi(config);
};
