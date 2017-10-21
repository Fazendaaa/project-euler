/*
                           Largest palindrome product

   A  palindromic  number  reads the same both ways. The largest palindrome made
   from the product of two 2-digit numbers is 9009 = 91 × 99.

   Find the largest palindrome made from the product of two 3-digit numbers.

                               Answer: 906609
*/

package main

import (
	"fmt"
	"math"
	"strconv"
)

func isPalindrome(number int) bool {
	read := strconv.Itoa(number)
	lenght := len(read)
	flag := true

	for i := 0; i < lenght/2; i++ {
		if read[i] != read[lenght-i-1] {
			flag = false
			break
		}
	}

	return flag
}

func largestPalindrome(digits float64, channel chan int) {
	var mult, max int

	for i := 1; i < int(math.Pow(10, digits)); i++ {
		for j := 1; j < int(math.Pow(10, digits)); j++ {
			mult = i * j

			if isPalindrome(mult) && mult > max {
				max = mult
			}
		}
	}

	channel <- max
}

func main() {
	var maxDigits float64 = 3
	channel := make(chan int, 1)

	go largestPalindrome(maxDigits, channel)

	fmt.Println(<-channel)
}
