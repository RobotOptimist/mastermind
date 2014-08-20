module Mastermind
	class DecodingBoard
		attr_accessor :codeboard
		def initialize(*peg_arrays)
			@codeboard = peg_arrays			
		end
	end
end