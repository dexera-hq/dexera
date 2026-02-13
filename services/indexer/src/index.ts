import { env } from "./env";

export function bootIndexer(): string {
  return `indexer booted in ${env.APP_ENV}`;
}
