/*
                           Largest prime factor

   The prime factors of 13195 are 5, 7, 13 and 29.

   What is the largest prime factor of the number 600851475143 ?

                           Answer: 6857
*/

package main

import (
	"fmt"
	"math"
)

func erastothenesSieve(limit int) int {
	numbers := make([]bool, limit)
	fmt.Println(numbers)

	for i := 0; i < int(math.Sqrt(float64(limit))); i++ {

	}

	return 1
}

func main() {
	fmt.Println(erastothenesSieve(13))
}
