import { z } from "zod";

const schema = z.object({
  APP_ENV: z.enum(["local", "dev", "staging", "prod"]).default("dev"),
  RPC_URL: z.string().url(),
  DATABASE_URL: z.string().min(1),
});

export const env = schema.parse({
  APP_ENV: process.env.APP_ENV,
  RPC_URL: process.env.RPC_URL,
  DATABASE_URL: process.env.DATABASE_URL,
});
