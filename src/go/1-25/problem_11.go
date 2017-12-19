/*
Largest product in a grid

    In the 20×20 grid below, four numbers along a diagonal line have been marked
    in red.

            08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
            49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
            81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
            52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
            22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
            24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
            32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
            67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
            24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
            21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
            78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
            16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
            86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
            19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
            04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
            88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
            04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
            20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
            20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
            01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48

    The product of these numbers is 26 × 63 × 78 × 14 = 1788696.

    What  is the greatest product of four adjacent numbers in the same direction
    ( up, down, left, right, or diagonally ) in the 20×20 grid?

						Answer: 70600674
*/

package main

import (
	"errors"
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"

	"../projectEuler"
)

// greatestSequential given vector and limit, returns it the max multiplied sequence of numbers.
func greatestSequential(vector []int, limit int) (int, error) {
	var message error
	var max, tmp int

	if nil != vector && 0 < limit {
		for i := 0; i <= len(vector)-limit; i++ {
			tmp = 1

			for j := i; j < i+limit; j++ {
				tmp *= vector[j]
			}

			if tmp > max {
				max = tmp
			}
		}

		message = nil
	} else {
		message = errors.New("greatestSequential - wrong function input")
	}

	return max, message
}

// greatestLines given matrix and limit, returns it the max of multiplied seuqence of all matrix lines.
func greatestLines(matrix [][]int, limit int) (int, error) {
	var rtnval, i int
	var message, err error
	var maxLines []int

	if nil != matrix {
		maxLines = make([]int, len(matrix))

		for _, vector := range matrix {
			tmp, err := greatestSequential(vector, limit)
			projectEuler.Check(err)

			maxLines[i] = tmp
			i++
		}

		rtnval, err = projectEuler.MaxVector(maxLines)
		projectEuler.Check(err)

		message = nil
	} else {
		rtnval = 0
		message = errors.New("greatestLines - wrong function input")
	}

	return rtnval, message
}

// transposeMatrix given matrix, returns it the transposed of that matrix.
func transposeMatrix(matrix [][]int) ([][]int, error) {
	var message error
	var nLines, nColumns, i, j int
	var transposed [][]int

	if nil != matrix {
		nLines = len(matrix)
		nColumns = len(matrix[0])
		transposed = make([][]int, nColumns)

		for k := 0; k < nColumns; k++ {
			transposed[k] = make([]int, nLines)
		}

		for _, line := range matrix {
			for _, value := range line {
				// Line becomes column
				transposed[i][j] = value
				i++
			}

			i = 0
			j++
		}

		message = nil
	} else {
		message = errors.New("transposeMatrix - wrong function input")
	}

	return transposed, message
}

// getDiagonals given matrix and limit, returns it the max multiplied value of both diagonals -- principal and secondary.
func getDiagonals(matrix [][]int, line int) ([]int, []int, error) {
	var posPrincipal, posSecondary int
	var message error
	var principal, secondary []int

	if nil != matrix && 0 <= line {
		principal = make([]int, 0)
		secondary = make([]int, 0)

		for i := 0; i < len(matrix); i++ {
			// Get the diagonal item position
			posPrincipal = len(matrix) - line + i
			posSecondary = line - i

			if 0 <= posPrincipal && posPrincipal < len(matrix) {
				principal = append(principal, matrix[i][posPrincipal])
			}

			if 0 <= posSecondary && posSecondary < len(matrix) {
				secondary = append(secondary, matrix[i][posSecondary])
			}
		}

		message = nil
	} else {
		message = errors.New("getDiagonals - wrong function input")
	}

	return principal, secondary, message
}

// greatestDiagonals given matrix and limit, returns it the max value of both multiplied diagonals -- principal and
// secondary.
func greatestDiagonals(matrix [][]int, limit int) (int, error) {
	var rtnval, principal, secondary, nLines, nColumns, nDiagonals int
	var principalDiagonal, secondaryDiagonal [][]int
	var message, err error

	if nil != matrix {
		nLines = len(matrix)
		nColumns = len(matrix[0])
		nDiagonals = nLines + nColumns - 1
		principalDiagonal = make([][]int, nDiagonals)
		secondaryDiagonal = make([][]int, nDiagonals)

		for i := 0; i < nDiagonals; i++ {
			principalDiagonal[i], secondaryDiagonal[i], err = getDiagonals(matrix, i)
			projectEuler.Check(err)
		}

		principal, err = greatestLines(principalDiagonal, limit)
		projectEuler.Check(err)

		secondary, err = greatestLines(secondaryDiagonal, limit)
		projectEuler.Check(err)

		if principal > secondary {
			rtnval = principal
		} else {
			rtnval = secondary
		}

		message = nil
	} else {
		rtnval = 0
		message = errors.New("greatestDiagonals - wrong function input")
	}

	return rtnval, message
}

// greatestProdutc given matrix and limit, returns it the max mutiplied values of the given matrix.
func greatestProduct(matrix [][]int, limit int) (int, error) {
	var rtnval, lines, columns, diagonal int
	var message error
	var invertedMatrix [][]int
	var result []int
	var err error

	if nil != matrix && 0 < limit {
		invertedMatrix, err = transposeMatrix(matrix)
		projectEuler.Check(err)

		lines, err = greatestLines(matrix, limit)
		projectEuler.Check(err)

		columns, err = greatestLines(invertedMatrix, limit)
		projectEuler.Check(err)

		diagonal, err = greatestDiagonals(matrix, limit)
		projectEuler.Check(err)

		result = make([]int, 3)

		result[0] = lines
		result[1] = columns
		result[2] = diagonal

		rtnval, err = projectEuler.MaxVector(result)
		projectEuler.Check(err)

		message = nil
	} else {
		rtnval = 0
		message = errors.New("greatestProduct - wrong function input")
	}

	return rtnval, message
}

// fileToMatrix given filename, open it the file and read it the matrix inside it.
func fileToMatrix(filename string) ([][]int, error) {
	var data []byte
	var str, line []string
	var matrix [][]int
	var tmp []int
	var i, j int
	var message, err error

	data, err = ioutil.ReadFile(filename)
	projectEuler.Check(err)

	if nil != data {
		str = strings.Split(string(data), "\n")
		// Doing like this because wheter the input file contais an empty line at the end of the file this will count as
		// a new array line
		matrix = make([][]int, 0)

		for _, vector := range str {
			if 0 < len(vector) {
				line = strings.Split(vector, " ")
				tmp = make([]int, len(line))

				for _, value := range line {
					tmp[j], err = strconv.Atoi(value)
					projectEuler.Check(err)
					j++
				}

				matrix = append(matrix, tmp)
				j = 0
				i++
			}
		}

		message = nil
	} else {
		message = errors.New("fileToMatrix - wrong function input")
	}

	return matrix, message
}

func main() {
	var err error
	var matrix [][]int
	var result int

	matrix, err = fileToMatrix("./input/problem_11.txt")
	projectEuler.Check(err)

	result, err = greatestProduct(matrix, 4)
	projectEuler.Check(err)

	fmt.Println(result)
}
