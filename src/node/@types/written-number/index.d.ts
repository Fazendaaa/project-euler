// It's not beautiful, but works.
declare module 'written-number' {
    export interface Options {
        noAnd: boolean;
        lang: string;
    }

    export function writtenNumber (n: number, options?: Options): string;
}
