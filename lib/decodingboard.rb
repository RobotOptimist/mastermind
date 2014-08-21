module Mastermind
	class DecodingBoard
		attr_reader :code_pegs
		attr_accessor :key_pegs
		def initialize(*peg_arrays)
			assign_peg_arrays(peg_arrays)
		end
		
		private
		
		def code_pegs=(peg_array)
			@code_pegs = peg_array
		end
		
		def assign_peg_arrays(peg_arrays)
			peg_arrays.each do |peg_arr|
				if peg_arr[0].class == Fixnum
					self.code_pegs = peg_arr
				end				
				if peg_arr[0].class == String
					self.key_pegs = peg_arr
				end
			end
		end
		
		public
		
		def change_key_peg(new_peg,place)
			@key_pegs[place] = new_peg
		end
		
		def display_board
			first_keys = [@key_pegs[0],@key_pegs[1]].join(' ')
			last_keys = [@key_pegs[2], @key_pegs[3]].join(' ')
			code_pegs = @code_pegs.map {|peg| peg.to_s}	
			code_pegs = code_pegs.join(' ')
			display = [first_keys, code_pegs, last_keys].join(' ')
		end
		
	end
end