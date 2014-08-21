require "spec_helper"

module Mastermind
	describe DecodingBoard do	
		it "can differentiate between the peg arrays and assign them appropriately" do
			decoding_board = DecodingBoard.new([1,2,3,4],["no","no","no","no"])
			expect(decoding_board.code_pegs).to eq [1,2,3,4]
			expect(decoding_board.key_pegs).to eq ["no","no","no","no"]
			order_wrong_board = DecodingBoard.new(["no","no","no","no"],[1,2,3,4])
			expect(decoding_board.code_pegs).to eq [1,2,3,4]
			expect(decoding_board.key_pegs).to eq ["no","no","no","no"]
		end
		
		it "displays the code pegs and the key pegs" do	
			decoding_board = DecodingBoard.new([1,2,3,4],["no","no","no","no"])
			expect(decoding_board.display_board).to eq "no no 1 2 3 4 no no"
		end
		
		it "can change a key peg" do
			decoding_board = DecodingBoard.new([1,2,3,4],["no","no","no","no"])
			decoding_board.change_key_peg("yes",0)
			expect(decoding_board.key_pegs[0]).to eq "yes"
			decoding_board.change_key_peg("yes",3)
			expect(decoding_board.key_pegs[3]).to eq "yes"
		end
	end
end