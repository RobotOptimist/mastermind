require "spec_helper"

module Mastermind

	describe CodeBreaker do
		it "should store a guess" do
			codebreaker = CodeBreaker.new
			codebreaker.guess = [1,2,3,4]
			expect(codebreaker.guess).to eq([1,2,3,4])
		end
		
		it "should submit guesses" do
		end
		
		it "should record the keypegs resulting from a guess" do
		end
		
		it "should sort and evaluate the keypegs" do
		end
		
		it "should resubmit a new guess based on the keypeg evaluation" do
		end
		
	end	
	
end