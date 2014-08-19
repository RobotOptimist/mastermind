require_relative "mastermind/version"

module Mastermind
	class DecodingBoard		
	end
	
	class CodePegs
		#set of 4 numbers 1-6, duplicates allowed
		attr_accessor :peg_set
		def initialize(*nums)
			@peg_set = nums if pegs_valid(nums) == true
		end
		
		def pegs_valid?(*nums)
			check = nums
			valid = false
			valid = true if check.all? {|peg| peg.between?(1,6)} && check.length == 4
			valid
		end
		
	end
	
	class KeyPegs
	end
	
	class CodeBreaker
	end
	
	class CodeMaker
	end
end

require_relative "mastermind/codepegs.rb"