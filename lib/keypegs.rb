module Mastermind
	class KeyPegs
	#key peg can have 3 values, no, match, and partial
		def initialize			
		end		
			
		def self.create_peg_set
			peg_set = []
			4.times {peg_set << create_peg}
			peg_set
		end
		
		def self.create_peg			
			peg = "no"
			peg
		end
		
		def self.peg_valid? (peg)
			valid = false
			case peg
			when "no" then valid = true
			when "match" then valid = true
			when "partial" then valid = true
			else "Peg is not valid."
			end
			valid
		end
	end
end