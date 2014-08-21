require 'spec_helper'

module Mastermind
	describe KeyPegs do
		before do
			@keypegs = KeyPegs.new
		end
		
		describe 'peg array' do
			it 'should initialize an array of strings which all state no' do
				@keypegs.peg_set.should == ["no","no","no","no"]
			end

			it 'should reject an array of invalid entries' do
				@keypegs.peg_set = ["yup", "nope", 33, true]
				@keypegs.peg_set.should == ["no","no","no","no"]
			end
		end
	end
		
end