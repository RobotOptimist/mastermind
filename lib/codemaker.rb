module Mastermind
	require_relative "codepegs.rb"
	class CodeMaker
	def initialize
	end
	
	def pick_code
		@code = CodePegs.create_peg_set
	end
	
	def code=(code)
		@code = code
	end
	
	def code
		@code
	end
	
	def count_possible_partials(num)
		@code.count(num)			
	end
	
	def count_actual_partials(num)
		#@code.count(num)
		#@keypegs.count("partial") where 
	end
	
	def analyze_guess(guess)
		keypegs = []
		guess.each_with_index do |num,index|
			possible_partial = count_possible_partials(num)
			actual_partial = keypegs.count("partial")			
			if @code[index] == num
				keypegs << "match"
			elsif @code.include?(num) && actual_partial < possible_partial
				keypegs << "partial"
			else  
				keypegs << "no"
			end
		end
		keypegs
	end
	
	end

require 'test\unit'

	class TestCodeMaker < Test::Unit::TestCase
		def test_pick_code
			tmaker = CodeMaker.new
			tmaker.pick_code
		
			assert_equal(4,tmaker.code.count)
		end
		
		def test_analyze_guess
			tmaker = CodeMaker.new
			tmaker.code = [1,1,3,4]
			
			assert_equal(["no","no","partial","partial"],tmaker.analyze_guess([2,2,1,1]))
			assert_equal(["no","match","partial","match"],tmaker.analyze_guess([2,1,1,4]))
			
			tmaker.code = [1,2,3,4]
			
			assert_equal(["no","partial","no","no"],tmaker.analyze_guess([5,1,1,1]))
			assert_equal(["partial","partial","partial","partial"],tmaker.analyze_guess([4,3,2,1]))
		end
	end

end