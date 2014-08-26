require "spec_helper"

module Mastermind

	describe CodeBreaker do
		it "should store a guess" do
			codebreaker = CodeBreaker.new
			codebreaker.guess = [1,2,3,4]
			expect(codebreaker.guess).to eq([1,2,3,4])
		end
		
		it "should make a new guess" do
			codebreaker = CodeBreaker.new
			codebreaker.make_guess
			expect(codebreaker.guess.count).to eq(4)
		end
		
		it "should record a guess it made up" do
			codebreaker = CodeBreaker.new
			first_guess = codebreaker.make_guess
			expect(codebreaker.guess).to eq(first_guess)
		end
		
		
		it "should not reuse bad guesses" do
			codebreaker = CodeBreaker.new
			keypegs = ["no","no","match","match"]			
			codebreaker.guess = [1,2,3,4]
			codebreaker.results_keypegs = keypegs
			guess = codebreaker.make_guess
			expect(guess).not_to include(1)
			expect(guess).not_to include(2)
		end
		
		
				
	end	
	
end