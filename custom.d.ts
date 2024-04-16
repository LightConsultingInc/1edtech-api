// custom.d.ts
declare module '*.sql' {
  const content: string;
  export default content;
}
