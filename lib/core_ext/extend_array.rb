class Array
	def swap_values(first_index,second_index)
		hold = self[first_index]
		self[first_index] = self[second_index]
		self[second_index] = hold
	end
	
	def shuffle_select_values(*args)
		values = []
		args.each do |arg|
			values << self[arg]
		end
		p values
		p args
		args.shuffle!
		
		args.each_with_index do |arg,index|
			self[arg] = values[index]
		end
	end
end