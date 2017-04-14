=begin
                            Integer right triangles

    If  p is the perimeter of a right angle triangle with integral length sides,
    {a,b,c}, there are exactly three solutions for p = 120.

    {20,48,52}, {24,45,51}, {30,40,50}

    For which value of p ≤ 1000, is the number of solutions maximised?

    Articles that helped me out:
        *   http://www.mathblog.dk/project-euler-39-perimeter-right-angle-triangle/
=end

def integer_right_triangles( limit )
    result = 0
    max = 0

    for p in ( 2..limit ).step( 2 ) do
        solutions = 0

        for a in 2..( p / 3 ).to_i do
            solutions += 1 if 0 == p*( p - 2*a ) % ( 2*( p - a ) )
        end

        if solutions > max then
            max = solutions
            result = p
        end
    end

    return result
end

puts integer_right_triangles( 1_000 )
