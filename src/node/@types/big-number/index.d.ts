// It's not beautiful, but works.
declare module 'big-number' {
    type BigNumber = {
        power: (pow: number) => number;
        number: Array<number>;
        sign: number;
        rest: number;
    };

    export function BigNumber(initialNumber: number): BigNumber;
}
