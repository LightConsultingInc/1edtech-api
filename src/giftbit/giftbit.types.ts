import { z } from 'zod';

export const BrandSchema = z.object({
  brand: z.object({
    brand_code: z.string(),
    name: z.string(),
    image_url: z.string(),
    disclaimer: z.string().optional(),
    embeddable: z.boolean(),
    variable_price: z.boolean(),
    min_price_in_cents: z.number().optional(),
    max_price_in_cents: z.number().optional(),
    allowed_prices_in_cents: z.array(z.number()).optional(),
  }),
});

export type Brand = z.infer<typeof BrandSchema>;

export const AllBrandsResponseSchema = z.object({
  brands: z.array(
    z.object({
      brand_code: z.string(),
      name: z.string(),
      image_url: z.string(),
      disclaimer: z.string().optional(),
    }),
  ),
  total_count: z.number(),
  offset: z.number(),
  limit: z.number(),
});

export type AllBrandsResponse = z.infer<typeof AllBrandsResponseSchema>;

export interface CreateGiftBitOrderRequest {}
