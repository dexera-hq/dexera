import { z } from "zod";

const envSchema = z.object({
  APP_ENV: z.enum(["local", "dev", "staging", "prod"]).default("dev")
});

export default {
  fetch(_request: Request, env: Record<string, string>) {
    const parsed = envSchema.parse(env);
    return new Response(JSON.stringify({ status: "ok", env: parsed.APP_ENV }), {
      headers: { "content-type": "application/json" }
    });
  }
};
