=begin
								Poker hands

	In  the  card game poker, a hand consists of five cards and are ranked, from
	lowest to highest, in the following way:

		* High Card: Highest value card.
		* One Pair: Two cards of the same value.
		* Two Pairs: Two different pairs.
		* Three of a Kind: Three cards of the same value.
		* Straight: All cards are consecutive values.
		* Flush: All cards of the same suit.
		* Full House: Three of a kind and a pair.
		* Four of a Kind: Four cards of the same value.
		* Straight Flush: All cards are consecutive values of same suit.
		* Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
		
	The cards are valued in the order:
	2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

	If  two  players  have  the  same  ranked hands then the rank made up of the
	highest value wins; for example, a pair of eights beats a pair of fives (see
	example  1  below).  But  if two ranks tie, for example, both players have a
	pair  of queens, then highest cards in each hand are compared (see example 4
	below);  if  the highest cards tie then the next highest cards are compared,
	and so on.

	Consider the following five hands dealt to two players:

	Hand	 	Player 1	 		Player 2	 		Winner
	
	1	 	 5H 5C 6S 7S KD		 2C 3S 8S 8D TD		   Player 2
			  Pair of Fives 	 Pair of Eights
	
	2	 	 5D 8C 9S JS AC 	 2C 5C 7D 8S QH 	   Player 1
		    Highest card Ace   Highest card Queen

	3	 	2D 9C AS AH AC 		 3D 6D 7D TD QD 	   Player 2
			  Three Aces 	  Flush with Diamonds

	4	 	4D 6S 9H QH QC 		 3D 6D 7H QD QS 	   Player 1
			Pair of Queens 		 Pair of Queens
		  Highest card Nine    Highest card Seven

	5	 	2H 2D 4C 4D 4S	     3C 3D 3S 9S 9D 	   Player 1
			  Full House 		   Full House
		   With Three Fours     With Three Threes

	The  file,  problem_54.txt,  contains one-thousand random hands dealt to two
	players.  Each  line  of  the file contains ten cards (separated by a single
	space): the first five are Player 1's cards and the last five are Player 2's
	cards.  You  can  assume  that all hands are valid (no invalid characters or
	repeated  cards),  each  player's  hand is in no specific order, and in each
	hand there is a clear winner.

	How many hands does Player 1 win?

	obs:
		S = Spades
		H = Hearts
		D = Diamonds
		C = Clubs

	Articles that helped me out:
		*	http://stackoverflow.com/a/13634446/7092954
		*	https://boardgamegeek.com/wiki/page/Standard_Deck_Playing_Card_Games&redirectedfrom=standard_deck_playing_card_game#
		*	http://stackoverflow.com/a/76046/7092954
=end

require_relative 'project_euler'

# ============================ Base functions ==================================

def __card_value( card )
	number = card.split( '' )[ 0 ]

	if 'T' == number
		number = 10
	elsif 'J' == number
		number = 11
	elsif 'Q' == number
		number = 12
	elsif 'K' == number
		number = 13
	elsif 'A' == number
		number = 14
	end

	return number
end

def card_value( card )
	number = card.split( '' )[ 0 ].to_i
	number = __card_value( card ) if 0 == number

	return number
end

def card_suit( card )
	return card.split( '' )[ -1 ]
end

def check_pair( n, hand )
	return hand.select { | e | hand.count( e ) == n }.uniq
end

def check_kind( n, hand )
	cards = hand.map { | e | card_value( e ) }
	return cards.select { | e | cards.count( e ) == n }
end

# ============================ Hand functions ==================================

# => Highest value card.
def is_high_card( hand )
	return hand.map { | e | card_value( e ) }.max
end

# => Two cards of the same value.
def is_one_pair( hand )
	pair = check_pair( 2, hand )
	return 1 == pair.length ? card_value( pair[ 0 ] ) : 0
end

# => Two different pairs.
def is_two_pair( hand )
	pair = check_pair( 2, hand )
	return 2 == pair.length ? pair.map{ | e | card_value( e ) }.sort.reverse :
							  [ 0 ]
end

# => Three cards of the same value.
def is_three_of_a_kind( hand )
	kind = check_kind( 3, hand )
	return 0 != kind.length ? kind : [ 0 ]
end

# => Four cards of the same value.
def is_four_of_a_kind( hand )
	kind = check_kind( 4, hand )
	return 0 != kind.length ? kind : 0
end

# => All cards are consecutive values.
def is_straight( hand )
	cards = hand.map { | e | card_value( e ) }.sort
	return ( 1..cards.length-1 ).all? { | i | cards[ i ]-1 == cards[ i-1 ] } ?
	1 : 0
end

# => All cards of the same suit.
def is_flush( hand )
	return 1 == hand.map { | e | card_suit( e ) }.uniq.length ? 1 : 0
end

# => Three of a kind and a pair.
def is_full_house( hand )
	return ( is_three_of_a_kind( hand ) && is_one_pair( hand ) ) ? 1 : 0
end

# => All cards are consecutive values of same suit.
def is_straight_flush( hand )
	return ( is_straight( hand ) && is_flush( hand ) ) ? 1 : 0
end

# => Ten, Jack, Queen, King, Ace, in same suit.
def is_royal_flush( hand )
	return ( is_flush( hand ) && is_flush( hand ) ) ? 1 : 0
end

# ============================ Game functions ==================================

def play_hand( hand )
	score = Array.new( 10 )

	score[ 0 ] = [ is_royal_flush( hand ) ]
	score[ 1 ] = [ is_straight_flush( hand ) ]
	score[ 2 ] = [ is_four_of_a_kind( hand ) ]
	score[ 3 ] = [ is_full_house( hand ) ]
	score[ 4 ] = [ is_flush( hand ) ]
	score[ 5 ] = [ is_straight( hand ) ]
	score[ 6 ] =   is_three_of_a_kind( hand )
	score[ 7 ] =   is_two_pair( hand )
	score[ 8 ] = [ is_one_pair( hand ) ]
	score[ 9 ] = [ is_high_card( hand ) ]
	
	return score
end

def compare_hands( hand_1, hand_2 )
	for i in 0..9 do
		if !hand_1[ i ].all? { | a | hand_2[ i ].all? { | b | a == b } } then
			winner = hand_1[i].all?{ |a| hand_2[ i ].all? { | b | a >= b } } ?
					:Player_1 : :Player_2
			break
		end
	end
	
	return winner
end

def poker_hands( filename )
	game = []
	
	File.open( filename, "r" ) do | file |
		file.each_line do | line |
			player_1, player_2 = in_groups( 2, line.scan( /\w+/ ) )
			winner = compare_hands( play_hand( player_1 ),
									play_hand( player_2 ) )
			game.push( [ player_1, player_2, winner ] )
		end
	end

	return game
end

puts poker_hands( "problem_54.txt" ).select { | e | :Player_1 == e[ 2 ] }.length