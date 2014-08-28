module Mastermind
	require_relative "codepegs.rb"
	require_relative "keypegs.rb"
	class Player
		attr_reader :codemaker, :guess_number
		def initialize
			@player_keys = KeyPegs.create_peg_set
		end
		
		def player_keys
			@player_keys
		end
		
		def player_code
			@player_code
		end
				
		def set_player_code
			code = [["first",0],["second",0],["third",0],["fourth",0]]
			code.each do |peg|
				puts "What will the #{peg[0]} peg be?"
				str = gets.chomp
				peg[1] = codepeg_check_n_convert(str)				
			end			
			@player_code = [code[0][1],code[1][1],code[2][1],code[3][1]]
		end
		
		def set_player_keys
			code = [["first",""],["second",""],["third",""],["fourth",""]]
			code.each do |peg|
				puts "Is the #{peg[0]} peg a match? (match, partial, or no)"
				str = gets.chomp
				peg[1] = keypeg_check(str)				
			end
			@player_keys = [code[0][1],code[1][1],code[2][1],code[3][1]]
		end
		
		def offer_choice
			puts "Will you be the code maker or the code breaker?"
			puts "1 = code maker"
			puts "2 = code breaker"
			choice = gets.chomp
			until @codemaker != nil do
				case choice
				when "1" then @codemaker = true
				when "2" then @codemaker = false
				when "codemaker" then @codemaker = true
				when "codebreaker" then @codebreaker = true
				else "Your choice is invalid! Try again!"
				end
			end
		end

		def number_of_guesses
			puts "How many guesses do you allow? Say 8, 10 or 12."
			choice = gets.chomp
			until @guess_number.class == Fixnum do
			@guess_number =	case choice
					when "8" then 8
					when "10" then 10
					when "12" then 12
					else "That is not valid! Try again."
				end
			end			
		end
		
		def guess_code
			puts "We've selected a secret code that is four digits long. Each digit is between 1 and 6"
			puts "You must guess the code..."	
			set_player_code
		end
		
		def make_code
			puts "You must select a secret code. Each digit is between 1 and 6"
			puts "Don't worry, I won't look..."
			set_player_code
		end
		
		def give_keys
			"Did I get any right?"
			set_player_keys
		end
		
		def codepeg_check_n_convert(str)
			begin
				num = str.to_i
				raise BadPegError, "Not a valid code peg." if CodePegs.peg_valid?(num) == false
			rescue	BadPegError
				puts "Please try again. Remember between 1 and 6!"
				str = gets.chomp
				codepeg_check_n_convert(str)
			end
			num
		end
		
		def keypeg_check(key)
			begin
				raise BadPegError, "Not a valid key peg." if KeyPegs.peg_valid?(key) == false
			rescue BadPegError
				puts "It must be match, partial or no."
				puts "Where match indicates the peg in this position is a match"
				puts "and partial indicates that the peg is not a match, but is somewhere in your code"
				puts "and no means, not a match - not even close!"
				puts "Try again please!"
				key = gets.chomp
				keypeg_check(key)
			end
			key
		end
		
		private :set_player_code, :codepeg_check_n_convert, :set_player_keys, :keypeg_check
	end
	
	class BadPegError < RuntimeError
	end
	
	require 'test\unit'
	
	class TestPlayer < Test::Unit::TestCase
		def test_offer_choice
			tplayer = Player.new
			tplayer.offer_choice
			assert(tplayer.codemaker != nil)
		end
		def test_number_of_guesses
			tplayer = Player.new
			tplayer.number_of_guesses
			assert(tplayer.guess_number != nil)
			assert(tplayer.guess_number.class == Fixnum)
		end
		def test_guess_code
			tplayer = Player.new
			tplayer.guess_code
			assert(CodePegs.peg_set_valid?(tplayer.player_code))
		end
		def test_make_code
			tplayer = Player.new
			tplayer.make_code
			assert(CodePegs.peg_set_valid?(tplayer.player_code))
		end
		def test_give_keys
			tplayer = Player.new
			tplayer.give_keys
			assert(KeyPegs.peg_set_valid?(tplayer.player_keys))
		end
	end	
end