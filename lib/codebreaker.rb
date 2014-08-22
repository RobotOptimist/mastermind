module Mastermind
	class CodeBreaker
	=begin
	This class needs knowledge of
	DecodingBoard class
	CodeMaker class
	CodePegs class
	This class needs methods for
	1)accepting a guess
	2)submitting a guess
	3)can make a guess	
	4)can evaluate key pegs and keep correct guesses
	5)can intelligently shuffle partial matches
	6)does not reuse bad guesses
	=end
	
	
	def guess=(guess)
		@guess = guess
	end
	
	def submit_guess(codemaker,decodingboard)
		@keypegs = codemaker.evaulate_guess(@guess)
		decodingboard.display_board(key_pegs,@guess)
	end
	
	def make_guess(codepegs)
		@oldguess = @guess
	end
	
	def evaluate_keypegs
		no_match_index = []
		no_match_pegs = []
		partial_match_index = []
		partial_match_pegs = []
		@keypegs.each_with_index do |peg,index|
			if peg == "no" 
				no_match_index << index
				no_match_pegs << peg
				next
			end			
			if peg == "match"
				@guess[index] = @oldguess[index]
			elsif peg == "partial"
				partial_match_index << index
				partial_match_pegs << peg
			end			
		end
	end
	
	def match_partial_with_no(no_match_index,partial_match_pegs)
		@guess.each_with_index do |peg,index|
			if peg != partial_match_pegs[i] && no_match_index.any? {|no| no == index}
				peg = partial_match_peg[i]
			end				
		end
	end
	
	def shuffle_partial
		if no_match_index.length == 0 && partial_match_index.length >= 2
			partial_match_index.each_with_index do |partial,index|
				hold = @guess[partial]
				@guess[partial] = @guess[partial_match_index[index+1]]
				@guess[partial_match_index[index+1]]
			end
		end
	end
		
end