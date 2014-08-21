module Mastermind
	class CodePegs
		#set of 4 numbers 1-6, duplicates allowed
		def initialize(*pegs)
			self.peg_set= pegs
		end
		
		def peg_set
			@peg_set
		end
		
		def ind_peg(position)
			@peg_set[position]
		end
		
		def peg_set=(pegs)
			if pegs_valid?(pegs) == true
				@peg_set = pegs 
			else
				puts "Invalid entries detected. Please submit a set of 4 numbers which are between 1 and 6."
				puts "setting peg_set to [0,0,0,0]"
				@peg_set = [0,0,0,0]
			end
		end
		
		def pegs_valid?(pegs)
			check = pegs
			valid = false
			valid = true if check.all? {|peg| peg.between?(1,6)} && check.length == 4
			valid
		end
		
	end
end
