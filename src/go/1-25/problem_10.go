/*
                       Summation of primes

   The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

   Find the sum of all the primes below two million.

                       Answer: 142913828922
*/

package main

import (
	"fmt"

	"../projectEuler"
)

func sumOfPrimes(limit int) int {
	var sum int

	for i := 2; i < limit; i++ {
		if projectEuler.IsPrime(i) {
			sum += i
		}
	}

	return sum
}

func main() {
	fmt.Println(sumOfPrimes(2000000))
}
