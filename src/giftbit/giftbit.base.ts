import { BaseApi } from 'src/api.base';
import {
  AllBrandsResponse,
  AllBrandsResponseSchema,
  Brand,
  BrandSchema,
} from './giftbit.types';

export enum GIFTBIT_STATUS_CODES {
  OK = 200,
}

export class GiftBitApi extends BaseApi {
  async listBrands(offset = 0): Promise<AllBrandsResponse> {
    const request = await this.requestData(`/brands?offset=${offset}`, 'GET');

    const data = await request.json();

    if (!(request.status === GIFTBIT_STATUS_CODES.OK)) {
      throw new Error(JSON.stringify(data));
    }

    const page = AllBrandsResponseSchema.parse(data);

    // recursively go through all pages
    if (page.total_count > page.offset + page.limit) {
      const nextPage = await this.listBrands(page.offset + page.limit);
      page.brands.push(...nextPage.brands);
    }

    return page;
  }

  async getBrand(brandCode: string): Promise<Brand> {
    const request = await this.requestData(`/brands/${brandCode}`, 'GET');

    const data = await request.json();

    if (!(request.status === GIFTBIT_STATUS_CODES.OK)) {
      throw new Error(JSON.stringify(data));
    }

    return BrandSchema.parse(data);
  }

  async redeemGiftCard(
    brandCode: string,
    id: string,
    price: number,
  ): Promise<string> {
    const request = await this.requestData(`/embedded`, 'POST', {
      brand_code: brandCode,
      price_in_cents: price,
      id,
    });

    const data = await request.json();

    if (!(request.status === GIFTBIT_STATUS_CODES.OK)) {
      throw new Error(JSON.stringify(data));
    }

    return data.gift_link;
  }
}
