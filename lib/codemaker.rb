module Mastermind
	class CodeMaker
	def initialize
	end
	
	def pick_code
		@code = CodePegs.create_peg_set
	end
	
	def user_pick_code
	end
	
	def analyze_code		
	end
	
	def analyze_guess(guess)
		return_keypegs
	end
	
	def return_keypegs
		["no","no","no","no"]
	end
	
	end
end