require 'spec_helper'

module Mastermind
	describe KeyPegs do	
		describe 'peg array' do
			it 'should be able to create a peg with a default value of no' do
				peg = KeyPegs.create_peg
				peg.should == "no"
			end

			it 'be able to create a set of new pegs' do
				pegs = KeyPegs.create_peg_set
				pegs.should == ["no","no","no","no"]
			end
			
			it 'should be able to check if a peg is valid' do
				peg = KeyPegs.create_peg
				KeyPegs.peg_valid?(peg).should == true
				peg = "bad"
				KeyPegs.peg_valid?(peg).should == false
			end
			
		end
	end
		
end