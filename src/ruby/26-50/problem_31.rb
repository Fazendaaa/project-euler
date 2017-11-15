=begin
                                Coin sums

    In  England the currency is made up of pound, £, and pence, p, and there are
    eight coins in general circulation:

            1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

    It is possible to make £2 in the following way:

                1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

    How many different ways can £2 be made using any number of coins?

    Articles that helped me out:
        *   http://www.geeksforgeeks.org/dynamic-programming-set-7-coin-change/
=end

def coin_sums( coins, length, value )
    return 1 if 0 == value
    return 0 if 0 > value
    return 0 if 0>= length && 1 <= value
    return coin_sums( coins, length - 1, value ) + coin_sums( coins, length, value - coins[ length - 1 ] )
end

coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
puts coin_sums( coins, coins.length, 200 )
