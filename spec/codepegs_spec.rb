require "spec_helper"
 
module Mastermind
  describe CodePegs do
    it "takes an array of 4 numbers" do
		codepegs = CodePegs.new(1,2,3,4)
		expect(codepegs.peg_set).to eq [1,2,3,4]
	end
	
	it "validates the 4 numbers" do
		codepegs = CodePegs.new(1,2,33,44)
		codepegs.peg_set.should == [0,0,0,0]
	end	
	
	it "can return a single peg in the set" do
		codepegs = CodePegs.new(1,2,3,4)
		codepegs.ind_peg(0).should == 1
	end
	
  end
end