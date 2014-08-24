module Mastermind
	class CodeBreaker
	#This class needs knowledge of
	#DecodingBoard class
	#CodeMaker class
	#CodePegs class
	#This class needs methods for
	#1)accepting a guess
	#2)submitting a guess
	#3)can make a guess	
	#4)can evaluate key pegs and keep correct guesses
	#5)can intelligently shuffle partial matches
	#6)does not reuse bad guesses	
	
	def initialize
		@guess
		@results_keypegs
		@no_matches
		@partial_matches
		@matches
	end
	
	
	def guess=(guess)
		@guess = guess
	end
	
	def guess
		@guess
	end
	
	def results_keypegs=
		@results_keypegs = keypegs		
	end
	
	def results_keypegs
		@results_keypegs
	end
	
	def make_guess
		if @keypegs == nil			
			@guess = make_all_new_guess
		elsif @keypegs.include?("no") && @keypegs.include?("partial")
			replace_no_with_partial
		elsif @keypegs.include?("partial") && @keypegs.include?("no") == false
			shuffle_partials
		elsif @keypegs.all? {|peg| peg != "partial"}
			@guess.each {|peg|peg = replace_no_with_new}
		else
			"Can't find a valid scenario!"
		end
	end
	
	def make_all_new_guess
		guess = CodePegs.create_peg_set
	end
	
	def replace_no_with_new
		bad_values = @no_matches.select {|value| value[0]}
		bad_indexes = @no_matches.select {|value| value[1]}
		loop do
			peg = CodePegs.create_peg
			if bad_values.include?(peg)
				next
			else
				break
			end
		end
		peg
	end
	
	def evaluate_keypegs
		record_no_matches
		record_partial_matches
		record_matches
	end
	
	def record_no_matches
		no_matches = []
		@results_keypegs.each_with_index do |value,index|
			no_matches << [value,index]
		end
		@no_matches = no_matches
	end
	
	def record_partial_matches
		partial_matches = []
		@results_keypegs.each_with_index do |value,index|
			partial_matches << [value,index]
		end
		@partial_matches = partial_matches
	end
	
	def record_matches
		matches = []
		@results_keypegs.each_with_index do |value,index|
			matches << [value,index]
		end
		@matches = matches
	end
	
	def combine_nomatchindex_with_partialvalue
		guess_pairs = []
		4.time do 
			i = 0
			if @no_maches[i][1] != nil
				guess_index = @no_matches[i][1] 
			else
				guess_index = 5
			end
			if @partial_matches[i][1] != nil
				guess_value = @partial_matches[i][0]
			else
				guess_value = guess_pairs[0][0]
			end
			guess_pairs << [guess_value,guess_index]
			i += 1
		end	
		guess_pairs
	end
	
	def replace_no_with_partial
		guess_pairs = combine_nomatchindex_with_partialvalue
		guess_pairs.each do |pair|
			if pair[0] != 5
				@guess[pair[0]] = pair[1]
			end
		end
	end
	
	def shuffle_partials
		swap = []
		@partial_matches.each do |partial|
			swap << partial[1]
		end
		if @partial_matches.count == 2
			@guess.swap_values(swap)
		else
			@guess.shuffle_select_values(swap)
		end
	end
	
	end
end