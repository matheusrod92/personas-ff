import z from "zod";

export const envSchema = z.object({
  PORT: z.coerce.number().int().default(5000),
  NODE_ENV: z.string().default("development"),
  HOST: z.string().default("localhost"),
  DATABASE_URL: z.string().default("file:./dev.db"),
});

export const env = envSchema.parse(process.env);
