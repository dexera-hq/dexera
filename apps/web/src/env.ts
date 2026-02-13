import { z } from "zod";

const schema = z.object({
  NEXT_PUBLIC_APP_ENV: z
    .enum(["local", "dev", "staging", "prod"])
    .default("local"),
  NEXT_PUBLIC_API_BASE_URL: z.string().url().default("http://localhost:3001"),
});

export const env = schema.parse({
  NEXT_PUBLIC_APP_ENV: process.env.NEXT_PUBLIC_APP_ENV,
  NEXT_PUBLIC_API_BASE_URL: process.env.NEXT_PUBLIC_API_BASE_URL,
});
