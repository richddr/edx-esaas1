def sum(integers)
	if integers.empty?
		return 0
	else
		count = 0
		integers.each do |i|
			count += i
			end
		return count
	end
end

def max_2_sum(integers)
	if integers.empty?
		return 0
	elsif integers.count == 1
		return integers[0]
	else
		integers.sort!{|x,y| y<=>x}
		return integers[0] + integers[1]
	end
end

def sum_to_n?(integers, n)
	if integers.empty? || integers.count == 1
		return false
	else
		integers.each do |i|
			for num in integers
				if num != i
					if i+num == n
						return true
					end
				end
			end
		end
		return false
	end
end