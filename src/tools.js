export function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export const defaultDuration = 10000