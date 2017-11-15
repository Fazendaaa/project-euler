=begin
                            Coded triangle numbers

    The  nth term of the sequence of triangle numbers is given by, tn = ½n(n+1);
    so the first ten triangle numbers are:

                    1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

    By  converting  each  letter  in  a  word  to  a number corresponding to its
    alphabetical  position  and  adding  these  values we form a word value. For
    example,  the  word  value  for  SKY is 19 + 11 + 25 = 55 = t10. If the word
    value is a triangle number then we shall call the word a triangle word.

    Using  words.txt,  a  16K  text  file  containing nearly two-thousand common 
    English words, how many are triangle words?

=end

def triangle_number( word )
    word.upcase.each_byte.reduce( 0 ) { | s, c | s + c - 64 }
end

def coded_triangle_numbers( filename )
    words = []
    hash = Hash.new( false )

    File.open( filename, "r" ) do | file |
        file.each_line do | line |
            words.concat( line.scan(/\w+/) )
        end
    end

    for n in 1..words.max.length*26 do 
        hash[ ( n*( n+1 ) / 2 ).to_i ] = true
    end

    return words.select { | word | hash[ triangle_number( word ) ] }
end

puts coded_triangle_numbers( "problem_42.txt" ).length