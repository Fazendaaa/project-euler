/*
							Even Fibonacci numbers

	Each  new term in the Fibonacci sequence is generated by adding the previous
	two terms. By starting with 1 and 2, the first 10 terms will be:

					1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

	By  considering  the  terms  in  the  Fibonacci sequence whose values do not
	exceed four million, find the sum of the even-valued terms.

								Answer: 4613732
*/

package main

import (
	"fmt"
)

func fibonacciNumbers(limit int, channel chan int) {
	i := 1
	fib := []int{1, 2}
	nextFib := 1
	sum := 2

	for {
		if fib[i] < limit {
			nextFib = fib[i] + fib[i-1]
			fib = append(fib, nextFib)

			if 0 == nextFib%2 {
				sum = sum + nextFib
			}

			i = i + 1
		} else {
			break
		}
	}

	channel <- sum
}

func main() {
	channel := make(chan int, 1)

	go fibonacciNumbers(4000000, channel)

	fmt.Println(<-channel)
}
