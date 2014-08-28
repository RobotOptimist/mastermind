module Mastermind
	require_relative "codepegs.rb"
	require_relative "keypegs.rb"
	class DecodingBoard
		#combines peg sets into a comprehensive whole and displays it		
		attr_accessor :key_pegs, :code_pegs, :display
		def initialize
			@display = []
		end
				
		private
		
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
		
		def format_board_line
			first_keys = [@key_pegs[0],@key_pegs[1]].join(' ')
			last_keys = [@key_pegs[2], @key_pegs[3]].join(' ')
			code_pegs = @code_pegs.map {|peg| peg.to_s}	
			code_pegs = code_pegs.join(' ')
			display = [first_keys, code_pegs, last_keys].join(' ')
			display
		end
		
		public
		
		def change_key_peg(new_peg,place)
			@key_pegs[place] = new_peg
		end
		
		def add_to_board(*peg_arrays)
			assign_peg_arrays(peg_arrays)
			@display << format_board_line			
		end
		
		def display_board
			@display.each {|line| puts line}			
		end				
	end
	
	require 'test\unit'
	
	class TestDecodingBoard < Test::Unit::TestCase
		def test_add_to_board
			tboard = DecodingBoard.new
			peg_set = CodePegs.create_peg_set
			key_set = KeyPegs.create_peg_set
			tboard.add_to_board(peg_set,key_set)
			assert_equal(1,tboard.display.count)			
		end
		def test_display_board
			tboard = DecodingBoard.new
			peg_set = CodePegs.create_peg_set
			key_set = KeyPegs.create_peg_set
			tboard.add_to_board(peg_set,key_set)
			tboard.display_board
			tboard.add_to_board(peg_set,key_set)
			tboard.display_board
		end
	end
	
end