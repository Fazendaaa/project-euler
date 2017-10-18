/*
                           Smallest multiple

   2520  is the smallest number that can be divided by each of the numbers from
   1 to 10 without any remainder.

   What  is the smallest positive number that is evenly divisible by all of the
   numbers from 1 to 20?

                           Answer: 232792560

   Helped me out:
       *   http://www.mathblog.dk/project-euler-problem-5/
*/
package main

import (
	"fmt"
	"math"

	"../projectEuler"
)

func main() {
	/*	Don't know why it works whe limit is 20 but not when it is 10. Probably
		something related to variables types.
	*/
	var limit float64 = 20
	limitLog := math.Log10(limit)
	primes := projectEuler.ErastothenesSieve(int(limit))
	result := 1

	for _, value := range primes {
		number := float64(value)
		result *= int(math.Pow(number, math.Floor(limitLog/math.Log10(number))))
	}

	fmt.Println(result)
}
