package projectEuler

import (
	"math"
	"math/big"
)

// ErastothenesSieve Nothing
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

// PrimesDecompositon From Rosetta Code
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
