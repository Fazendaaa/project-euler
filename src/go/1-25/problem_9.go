/*
                       Special Pythagorean triplet

   A  Pythagorean  triplet  is  a  set of three natural numbers, a < b < c, for
   which,
                               a² + b² = c²

   For example, 3² + 4² = 9 + 16 = 25 = 5².

   There exists exactly one Pythagorean triplet for which a + b + c = 1000.
   Find the product abc.

						Answer = 31875000
*/

package main

import (
	"fmt"
	"math"
)

func specialPythagoreanTriplet(sum int) []float64 {
	triplet := make([]float64, 0)
	flag := false
	var quadratic float64 = 2
	var a float64 = 1
	var b float64 = 1
	var c float64 = 1
	var limit = float64(sum)

	/*	This isn't a good limit, but it's a limit.	*/
	for ; c < limit; c++ {
		for b = 1; b < c; b++ {
			for a = 1; a < b; a++ {
				if a+b+c == limit && math.Pow(a, quadratic)+math.Pow(b, quadratic) == math.Pow(c, quadratic) {
					triplet = append(triplet, a, b, c)
					flag = true
				}

				if true == flag {
					break
				}
			}

			if true == flag {
				break
			}
		}

		if true == flag {
			break
		}
	}

	return triplet
}

func main() {
	triplet := specialPythagoreanTriplet(1000)
	var mult float64 = 1

	for _, item := range triplet {
		mult *= item
	}

	fmt.Println(int(mult))
}
