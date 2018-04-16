package projectEuler

import (
	"errors"
	"math"
	"math/big"
)

// ErastothenesSieve returns the prime decompositon.
func ErastothenesSieve(limit int) []int {
	numbers := make([]int, limit)
	result := []int{1, 2, 3}

	if 3 < limit {
		for i := 2; i < int(math.Sqrt(float64(limit))); i++ {
			for j := int(math.Pow(float64(i), float64(2))); j < limit; j += i {
				numbers[j] = -1
			}
		}

		for i := 4; i < limit; i++ {
			if -1 != numbers[i] {
				result = append(result, i)
			}
		}

		return result

	} else if 0 < limit {
		sub := make([]int, limit)
		copy(sub, result[0:limit])

		return sub

	} else {
		empty := []int{}

		return empty
	}
}

var (
	ZERO = big.NewInt(0)
	ONE  = big.NewInt(1)
)

// PrimesDecompositon from Rosetta Code.
func PrimesDecompositon(n *big.Int) []*big.Int {
	res := []*big.Int{}
	mod, div := new(big.Int), new(big.Int)

	for i := big.NewInt(2); i.Cmp(n) != 1; {
		div.DivMod(n, i, mod)

		for mod.Cmp(ZERO) == 0 {
			res = append(res, new(big.Int).Set(i))
			n.Set(div)
			div.DivMod(n, i, mod)
		}

		i.Add(i, ONE)
	}

	return res
}

// IsPrime returns wether or not a given number is prime.
func IsPrime(number int) bool {
	var flag = true
	var i float64

	if 2 <= number {
		for i = 2; i <= math.Sqrt(float64(number)); i++ {
			if 0 == number%int(i) {
				flag = false
				break
			}
		}
	} else {
		flag = false
	}

	return flag
}

// Check verifies whether or not a function returns an error.
func Check(e error) {
	if nil != e {
		panic(e)
	}
}

// MaxVector returns the max int from a vector.
func MaxVector(vector []int) (int, error) {
	var max int
	var message error

	if nil != vector {
		for _, v := range vector {
			if v > max {
				max = v
			}
		}

		message = nil
	} else {
		message = nil
	}

	return max, message
}

// MinVector returns the min int from a vector.
func MinVector(vector []int) (int, error) {
	var min int
	var message error

	if nil != vector {
		for _, v := range vector {
			if v < min {
				min = v
			}
		}

		message = nil
	} else {
		message = nil
	}

	return min, message
}

// FcatorDecomposition given number, returns it the factor decomposition of it.
func FactorDecomposition(number int) ([]int, error) {
	var rtnval int
	var message error

	if 0 != number {

		rtnval = 0
		message = nil
	} else {
		rtnval = 0
		message = errors.New("FactorDecompostion - wrong input")
	}

	return rtnval, message
}
