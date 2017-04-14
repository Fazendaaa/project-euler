=begin
								XOR decryption
	
	Each  character  on  a  computer is assigned a unique code and the preferred
	standard  is  ASCII ( American  Standard Code for Information Interchange ).
	For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

	A  modern  encryption  method  is  to take a text file, convert the bytes to
	ASCII,  then  XOR each byte with a given value, taken from a secret key. The
	advantage with the XOR function is that using the same encryption key on the
	cipher  text,  restores  the  plain text; for example, 65 XOR 42 = 107, then
	107 XOR 42 = 65.

	For  unbreakable  encryption,  the  key is the same length as the plain text
	message,  and  the  key  is made up of random bytes. The user would keep the
	encrypted message and the encryption key in different locations, and without
	both "halves", it is impossible to decrypt the message.

	Unfortunately,  this  method  is impractical for most users, so the modified
	method  is  to  use a password as a key. If the password is shorter than the
	message,  which  is  likely,  the  key is repeated cyclically throughout the
	message.  The balance  for this method is using a sufficiently long password
	key for security, but short enough to be memorable.

	Your  task has been made easy, as the encryption key consists of three lower
	case characters. Using problem_59.txt, a file containing the encrypted ASCII
	codes,  and  the  knowledge  that the plain text must contain common English
	words,  decrypt  the  message  and  find  the sum of the ASCII values in the
	original text.

	Helped me out:
		*	https://rubygems.org/gems/ruby-dictionary/versions/1.1.1
		*	http://www.theasciicode.com.ar/ascii-printable-characters/lowercase-letter-a-minuscule-ascii-code-97.html
		*	https://github.com/dwyl/english-words
		*	http://stackoverflow.com/a/22309665/7092954
		*	http://rubylearning.com/blog/2011/07/12/throw-catch-raise-rescue--im-so-confused/
		*	http://apidock.com/ruby/Array/product
		*	http://stackoverflow.com/a/5424389/7092954
=end

require 'ruby-dictionary'

def is_readable( text, dictionary )
	return text.join.gsub( /[^a-zA-Z]/, " " ).split( " " ).
				all? { | e | dictionary.exists?( e ) }
end

def xor_decryption( filename )
	dictionary = Dictionary.from_file( "input/words.txt" )
	encrypted = []

	File.open( filename, "r" ) do | file | 
		file.each_line do | line |
			encrypted.concat( line.scan( /\d+/ ) )
		end
	end
	
	decrypted = catch( :finished ) {
		encrypted.map!( &:to_i )
		# => checking  all  possibless  three lower case as key from "a" = 97 to
		# => "z" = 122
		for key in ( 97..122 ).to_a.permutation( 3 ) do
			words = encrypted.each_with_index.map { | e, i |
													( e ^ key[ i % 3 ] ).chr }
			throw :finished, words if is_readable( words, dictionary )
		end

		# => case didn't find a key decrpted will recieve nil
		throw :finished, nil
	}

	return decrypted
end

message = xor_decryption( "input/problem_59.txt" )
# => want to see the decrpyted message? Just uncomment the line bellow
#puts message.join
puts message.map { | e | e.ord }.reduce( :+ )