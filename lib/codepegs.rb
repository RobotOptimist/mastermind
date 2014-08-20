module Mastermind
	class CodePegs
		#set of 4 numbers 1-6, duplicates allowed
		attr_accessor :peg_set
		def initialize(*nums)
			if pegs_valid?(nums) == true
				@peg_set = nums 
			else
				@peg_set = [0,0,0,0]
			end
		end
		
		def pegs_valid?(nums)
			check = nums
			valid = false
			valid = true if check.all? {|peg| peg.between?(1,6)} && check.length == 4
			valid
		end
		
	end
end
