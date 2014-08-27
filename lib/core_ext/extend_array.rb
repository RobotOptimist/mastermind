class Array
	def swap_values(first_index,second_index)
		hold = self[first_index]
		self[first_index] = self[second_index]
		self[second_index] = hold
	end
	
	def shuffle_select_values(*args)
		values = []
		args.flatten!
		args.each do |arg|
			values << self[arg]
		end

		args.shuffle!
		
		args.each_with_index do |arg,index|
			self[arg] = values[index]
		end
	end
	
	def find_all_indexes(arg = nil) 
		indexes = []
		if block_given?			
			self.each_with_index do |s,index|
				indexes << index if yield s
			end
		else
			self.each_with_index do |s,index|
				indexes << index if s == arg
			end
		end
		indexes
	end
end