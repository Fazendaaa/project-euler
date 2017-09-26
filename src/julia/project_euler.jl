module project_euler
    export prime_factors

    # It isn't the best algorithm, but is easy to read
    function prime_factors(limit::Int)
        factors = []
        p = 2
        n = limit

        while n >= p*p 
            if 0 == n%p
                push!(factors, p)
                n = n/p
            else
                p += 1
            end
        end
        
        return push!(factors, n)
    end
end
