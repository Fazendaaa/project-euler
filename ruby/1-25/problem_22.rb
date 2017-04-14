=begin
                                Names scores

    Using  problem_22.txt,  a  46K text file containing over five-thousand first
    names,  begin  by  sorting  it into alphabetical order. Then working out the
    alphabetical  value  for  each name, multiply this value by its alphabetical
    position in the list to obtain a name score.

    For  example,  when the list is sorted into alphabetical order, COLIN, which
    is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
    would obtain a score of 938 × 53 = 49714.

    What is the total of all the name scores in the file?

    obs: articles that helped me out:
        *   http://stackoverflow.com/a/5545284/7092954
=end

#!/usr/bin/ruby

def names_scores( filename )
    names = []

    File.open( filename, "r" ) do | file |
        file.each_line do | line |
            names.concat( line.scan( /\w+/ ) )
        end
    end

    return names.sort.each_with_index.map { | name, index |
           name.each_byte.map { | e | e - 64 }.reduce( :+ ) * ( index + 1 ) }
end

puts names_scores( "input/problem_22.txt" ).reduce( :+ )
