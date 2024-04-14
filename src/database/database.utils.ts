export const catchingUserErrors = (err: unknown) => {
  if (!(err instanceof Error)) return false;
  return (
    err.message.includes('duplicate key value violates unique constraint') ||
    err.message.includes('violates not-null constraint')
  );
};
