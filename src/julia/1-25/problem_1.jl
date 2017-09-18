#=
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
=#

function multiples(a::Int, b::Int, limit::Int)
    array = []

    for i in 2:limit-1
        if 0 == i%a || 0 == i%b
            push!(array, i)
        end
    end

    return array
end

println(sum(multiples(3, 5, 1000)))
