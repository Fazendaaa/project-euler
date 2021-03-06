/*
                       Sum square difference

   The sum of the squares of the first ten natural numbers is,

                   1² + 2² + ... + 10² = 385

   The square of the sum of the first ten natural numbers is,

               (1 + 2 + ... + 10)² = 55² = 3025

   Hence the difference between the sum of the squares of the first ten natural
   numbers and the square of the sum is 3025 − 385 = 2640.

   Find  the difference between the sum of the squares of the first one hundred
   natural numbers and the square of the sum.

   						Answer: 25164150
*/
package main

import "fmt"
import "math"

func sumSquareDiff(limit float64, channel chan int) {
	var squareSum float64 = 0
	var sumSquare float64 = 0
	var i float64 = 0
	exp := float64(2)

	if 1 <= limit {
		for i = 1; i <= limit; i++ {
			sumSquare += math.Pow(i, exp)
			squareSum += i
		}
	}

	channel <- int(math.Pow(squareSum, exp) - sumSquare)
}

func main() {
	channel := make(chan int, 1)
	var limit float64 = 100

	/*	This version with goroutines did not have any time pros against the other with out it	*/
	go sumSquareDiff(limit, channel)

	fmt.Println(<-channel)
}
