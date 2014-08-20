require "spec_helper"
 
module Mastermind
  describe CodePegs do
    it "takes an array of 4 numbers" do
		codepegs = CodePegs.new(1,2,3,4)
		expect(codepegs.peg_set).to eq [1,2,3,4]
	end
	
	it "validates the 4 numbers" do
		codepegs = CodePegs.new(1,2,33,44)
		expect(codepegs.peg_set).to eq [0,0,0,0]
	end	
  end
end