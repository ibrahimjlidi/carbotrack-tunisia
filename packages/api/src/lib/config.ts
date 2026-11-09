import { z } from 'zod';

const envSchema = z.object({
  DB_HOST: z.string().trim().min(1, 'DB_HOST is required.'),
  DB_USER: z.string().trim().min(1, 'DB_USER is required.'),
  DB_PASSWORD: z.string().trim().min(1, 'DB_PASSWORD is required.'),
  DB_NAME: z.string().trim().min(1, 'DB_NAME is required.'),
  DB_PORT: z.coerce.number().int().min(1).max(65535).default(3306),
  JWT_SECRET: z.string().trim().min(32, 'JWT_SECRET must be at least 32 characters long.'),
  PORT: z.coerce.number().int().min(1).max(65535).default(4000),
  NODE_ENV: z.string().default('development'),
  CORS_ORIGIN: z.string().optional().transform((value) =>
    value?.split(',').map((origin) => origin.trim()).filter(Boolean) ?? [],
  ),
});

export type AppConfig = z.infer<typeof envSchema>;

export function loadConfig(env: NodeJS.ProcessEnv = process.env): AppConfig {
  const parsed = envSchema.safeParse(env);

  if (!parsed.success) {
    const details = parsed.error.issues
      .map((issue) => `${issue.path.join('.') || 'env'}: ${issue.message}`)
      .join('; ');
    throw new Error(`Invalid environment configuration: ${details}`);
  }

  return parsed.data;
}

export const config = loadConfig();

export function isCorsOriginAllowed(origin: string | undefined, appConfig: AppConfig = config): boolean {
  if (!origin) return true;
  if (appConfig.CORS_ORIGIN.length === 0) return appConfig.NODE_ENV !== 'production';
  return appConfig.CORS_ORIGIN.includes(origin);
}
