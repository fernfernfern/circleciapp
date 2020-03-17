export default function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

const defaultDuration = 10000