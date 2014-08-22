class Array
	def swap_values(first_index,second_index)
		hold = self[first_index]
		self[first_index] = self[second_index]
		self[second_index] = hold
	end
end