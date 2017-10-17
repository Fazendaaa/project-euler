/*
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
*/
package main

import (
	"fmt"
)

func sumOfMultiples(a int, b int, limit int) int {
	var sum int

	for i := 0; i < limit; i++ {
		if 0 == i%a || 0 == i%b {
			sum = sum + i
		}
	}

	return sum
}

func main() {
	fmt.Println(sumOfMultiples(3, 5, 1000))
}
