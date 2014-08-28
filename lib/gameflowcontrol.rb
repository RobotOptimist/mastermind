module Mastermind
	class GameFlowControl
		require_relative "decodingboard.rb"
		require_relative "codebreaker.rb"
		require_relative "codemaker.rb"
		require_relative "player.rb"
		def initialize
			@player = Player.new
			@codemaker = CodeMaker.new
			@codebreaker = CodeBreaker.new
			@decodingboard = DecodingBoard.new
		end
		
		def begin_game
			puts "Welcome to Mastermind!"
			puts ""
			@player.offer_choice
			@player.number_of_guesses
			play_game
		end
		
		def play_game
			@player.codemaker == true ? player_codemaker : player_codebreaker
		end
		
		def player_codemaker
			code = @player.make_code
			keys = @player.player_keys
			i = 0
			
			@player.guess_number.times do
				guess = @codebreaker.make_guess
				i += 1
				p guess
				@decodingboard.add_to_board(guess,keys)	
				@decodingboard.display_board
				keys = @player.give_keys
				@codebreaker.results_keypegs = keys
				if win?(keys)
					codemaker_lose(i) 
					break
				end
			end
			
			if i > @player.guess_number
				puts "CONGRATULATIONS!"
				puts "You Win!"
			end
			
		end
		
		def codemaker_lose(i)
			puts "Ha! I guessed your code in #{i} tries. I'm a genius! You lose!"
		end
		
		def player_codebreaker
			code = @codemaker.pick_code
			keys = @player.player_keys
			i = 0
			
			@player.guess_number.times do
				guess = @player.guess_code
				i += 1
				keys = @codemaker.analyze_guess(guess)
				@decodingboard.add_to_board(guess,keys)
				@decodingboard.display_board
				if win?(keys)
					codebreaker_win(i)
					break
				end
			end
			
			if i > @player.guess_number			
				puts "HA! I am the master! Bow before your AI Overlord."
				puts "Do it! Bow! Why aren't you bowing?"
				puts "You lose!"
			end
			
		end
		
		def codebreaker_win(i)
			puts "Impossible! You guessed the code!!"
			puts "You win!"
		end
		
		def win?(keys)
			win = false
			win = true if keys.all? {|key| key == "match"}
			win
		end
						
	end
	
	require 'test\unit'
	
	class TestGameFlowControl < Test::Unit::TestCase
		def testgame
			tgame = GameFlowControl.new
			tgame.begin_game
		end
	end
end