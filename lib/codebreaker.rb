module Mastermind
	require_relative "codepegs.rb"
	require_relative "core_ext/extend_array.rb"
	class CodeBreaker	
	attr_reader :no_matches, :partial_matches, :matches
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
	end
	
	
	def guess=(guess)
		@guess = guess
	end
	
	def guess
		@guess
	end
	
	def results_keypegs=(keypegs)
		@results_keypegs = keypegs
		evaluate_keypegs
	end
	
	def results_keypegs
		@results_keypegs		
	end
	
	def make_guess
		if @results_keypegs == nil			
			@guess = make_all_new_guess
		elsif @results_keypegs.include?("no") && @results_keypegs.include?("partial")
			replace_no_with_partial
		elsif @results_keypegs.include?("partial") && @results_keypegs.include?("no") == false
			shuffle_partials
		elsif @results_keypegs.all? {|peg| peg != "partial"}
			replace_no_with_new
		else
			"Can't find a valid scenario!"
		end
		guess
	end
		
	def make_all_new_guess
		guess = CodePegs.create_peg_set
	end
	
	def replace_no_with_new
		bad_values = []; bad_indexes = []		
		@no_matches.each {|value| bad_values << value[0]}
		@no_matches.each {|value| bad_indexes << value[1]}		
		until bad_indexes.empty? do
			peg = CodePegs.create_peg
			if bad_values.include?(peg)
				next
			else
				index = bad_indexes.pop
				@guess[index] = peg							
			end
		end
	end
	
	def evaluate_keypegs
		record_no_matches
		record_partial_matches
		record_matches
	end
	
	def record_no_matches
		@no_indexes = []; values = []
		@results_keypegs.each_with_index {|value,index|	@no_indexes << index if value == "no"}
		@guess.each_with_index {|value,index| values << value if @no_indexes.include?(index)}
		@no_matches = values.zip(@no_indexes)	
	end
	
	def record_partial_matches
		@partial_indexes = []; @partial_values = []
		@results_keypegs.each_with_index {|value,index|	@partial_indexes << index if value == "partial"}
		@guess.each_with_index {|value,index| @partial_values << value if @partial_indexes.include?(index)}		
		@partial_matches = @partial_values.zip(@partial_indexes)
	end
	
	def record_matches
		matches_indexes = []; values = []
		@results_keypegs.each_with_index {|value,index|	matches_indexes << index if value == "match"}
		@guess.each_with_index {|value,index| values << value if matches_indexes.include?(index)}		
		@matches = values.zip(matches_indexes)
	end
	
	def combine_nomatchindex_with_partialvalue		
		combo = @partial_values.zip(@no_indexes)
		combo	
	end
	
	def replace_no_with_partial
		guess_pairs = combine_nomatchindex_with_partialvalue
		if @results_keypegs.count("no") >= 2 && @results_keypegs.count("partial") == 1
			partial = @guess[@partial_indexes[0]]
			@no_indexes.each do |no|
				@guess[no] = partial
			end
		elsif @results_keypegs.count("no") == 1 && @results_keypegs.count("partial") >= 2
			shuffle_partials
		elsif @results_keypegs.count("no") == 1 && @results_keypegs.count("partial") == 1
			@guess[@no_indexes[0]] = @guess[@partial_indexes[0]]
		else
			replace_no_with_new
		end
	end
	
	def shuffle_partials
		@partial_indexes
		if @partial_indexes.count == 2
			@guess.swap_values(@partial_indexes[0],@partial_indexes[1])
		else
			@guess.shuffle_select_values(@partial_indexes)
		end
		replace_no_with_new
	end
	
	private :shuffle_partials, :replace_no_with_partial, :combine_nomatchindex_with_partialvalue, :record_matches, :record_partial_matches, :record_no_matches
	private :evaluate_keypegs, :replace_no_with_new
	
	end

require 'test\unit'

class TestCodeBreaker < Test::Unit::TestCase
	def test_evaluate_keypegs
		tbreaker = CodeBreaker.new
		tbreaker.guess = [1,2,3,4]
		tbreaker.results_keypegs = ["no","no","match","match"]					
	end
	
	def test_replace_no_with_new
		tbreaker = CodeBreaker.new
		tbreaker.guess = [1,2,3,4]
		tbreaker.results_keypegs = ["no","no","match","match"]		
		tbreaker.make_guess
		
		assert(tbreaker.guess.include?(1) == false)
		assert(tbreaker.guess.include?(2) == false)
	end
	
	def test_shuffle_partials
		tbreaker = CodeBreaker.new
		tbreaker.guess = [1,2,3,4]
		tbreaker.results_keypegs = ["match","match","partial","partial"]
		tbreaker.make_guess
		
		assert(tbreaker.guess) == [1,2,4,3]
		
		tbreaker.guess = [1,2,3,4]
		tbreaker.results_keypegs = ["match","partial","partial","partial"]
		tbreaker.make_guess
		
		assert(tbreaker.guess) == [1,3,4,2] 
	end
	
	def test_replace_no_with_partial
		tbreaker = CodeBreaker.new
		tbreaker.guess = [1,2,3,4]
		tbreaker.results_keypegs = ["no","no","no","partial"]
		tbreaker.make_guess
		
		assert(tbreaker.guess) == [4,4,4,4]
		
		tbreaker.guess = [3,4,2,4]
		p tbreaker.guess
		tbreaker.results_keypegs = ["partial", "no", "partial", "match"]
		
		p tbreaker.make_guess
	end
	
	def test_keeps_matches
		tbreaker = CodeBreaker.new
		tbreaker.guess = [1,2,3,4]
		tbreaker.results_keypegs = ["match","match","match","match"]
		tbreaker.make_guess
		assert_equal([1,2,3,4],tbreaker.guess)
	end
	
	def test_series_of_guesses
		tbreaker = CodeBreaker.new
		code = [1,2,3,4]
		tbreaker.guess= [4,5,5,6]
		tbreaker.results_keypegs = ["partial","no","no","no"]
		tbreaker.make_guess		
	end
end

end