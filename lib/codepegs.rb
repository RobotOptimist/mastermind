module Mastermind
	class CodePegs
		#set of 4 numbers 1-6, duplicates allowed
		def initialize
		end
						
		def self.create_peg_set
			peg_set = []
			4.times {peg_set << create_peg}
			peg_set
		end
		
		def self.create_peg
			rpeg = Random.new
			peg = rpeg.rand(1..6)
			peg
		end
		
		def self.peg_set_valid?(pegs)
			check = pegs
			valid = false
			valid = true if check.all? {|peg| peg_valid?(peg)} && check.length == 4
			valid
		end
		
		def self.peg_valid?(peg)
			valid = false
			valid = true if peg.between?(1,6)
			valid
		end
		
	end
end
