module Mastermind
	class KeyPegs
		def initialize(*pegs)
			self.peg_set = pegs
		end
		
		def peg_set
			@peg_set
		end
		
		def peg_set=(pegs)
			@peg_set = pegs
		end
		
		def pegs_valid?
		end
		
		def peg_valid?
		end
		
		def change_peg
		end
	end
end