// returns a config variable from the environment if it exists, or from the functions config if available.
export function getConfigVar(envVar: string, error: boolean = false) {
  const value = process.env[envVar.toLocaleUpperCase()];
  if (value === undefined) {
    if (error) {
      throw new Error(
        `Attempted to fetch config variable ${envVar} but it was not found.`,
      );
    } else {
      console.warn(
        `Attempted to fetch config variable ${envVar} but it was not found.`,
      );
    }

    return '';
  }
  return value;
}
