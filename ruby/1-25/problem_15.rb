=begin
                                Lattice paths

    Starting  in  the top left corner of a 2×2 grid, and only being able to move
    to  the  right  and  down,  there  are  exactly 6 routes to the bottom right
    corner.

    see image at - https://projecteuler.net/project/images/p015.gif

    How many such routes are there through a 20×20 grid?

                            Answer: 137846528820

    Helped me out:
        * http://www.robertdickau.com/lattices.html
        * http://www.robertdickau.com/manhattan.html
=end

#!/usr/bin/ruby

def number_of_lattice_paths( grid_size )
    return ( 1..2*grid_size ).reduce( :* ) / ( 1..grid_size ).reduce( :* )**2
end

puts number_of_lattice_paths( 20 )
