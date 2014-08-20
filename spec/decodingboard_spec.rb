require "spec_helper"

module Mastermind
	describe DecodingBoard do
		it "accepts codepegs and stores them" do
			decoding_board = DecodingBoard.new([1,2,3,4])
			expect(decoding_board.codeboard).to eq [[1,2,3,4]]
		end
		
		it "accepts an array of codepegs and an array of keypegs and stores them" do
			decoding_board = DecodingBoard.new([1,2,3,4],["no","no","no","no"])
			expect(decoding_board.codeboard).to eq [[1,2,3,4],["no","no","no","no"]]
		end
		
		it "displays the codepegs and the keypegs" do			
		end
	end
end