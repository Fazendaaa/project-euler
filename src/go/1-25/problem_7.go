/*
                               10001st prime

   By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
   that the 6th prime is 13.

   What is the 10 001st prime number?

                               Answer: 104743
*/
package main

import (
    "fmt"
    "../projectEuler"
)

/*  This  isn't  the  FASTEST way to do this, but this ensures me that given any
    input, it will works
*/
func nthPrimeNumber(pos int) int {
    var number = 2
    var counter = 0
    
    for {
        if projectEuler.IsPrime(number) {
            counter += 1
            
            if counter == pos {
                break
            }
        }
        
        number += 1
    }

    return number
}

func main() {
    /*  This code had a tiny improvement using goroutines   */
    go fmt.Println(nthPrimeNumber(104743))
}
