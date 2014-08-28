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
			valid = case peg
			when "no" then true
			when "match" then true
			when "partial" then true
			else false
			end
			valid
		end
		
		def self.peg_set_valid?(peg_set)
			valid = false
			valid = true if peg_set.all? {|peg| peg_valid?(peg)} && peg_set.length == 4
			valid
		end
	end
end