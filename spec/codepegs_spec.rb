require "spec_helper"
 
module Mastermind
  describe CodePegs do
    it "can create a code peg" do
		peg = CodePegs.create_peg
		peg.class.should == Fixnum
	end
	
	it "can validate a peg" do
		peg = 4
		CodePegs.peg_valid?(peg).should == true
		peg = 7
		CodePegs.peg_valid?(peg).should == false
	end	
	
	it "can validate a set of pegs" do
		pegs = [1,2,3,4]
		CodePegs.peg_set_valid?(pegs).should == true
		pegs = [7,7,7,7]
		CodePegs.peg_set_valid?(pegs).should == false
	end
	
	it "can create a set of code pegs" do
		pegs = CodePegs.create_peg_set
		CodePegs.peg_set_valid?(pegs).should == true	
	end
	
	end
end