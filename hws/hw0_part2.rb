def hello(name)
	"Hello, #{name}"
end

def starts_with_consonant?(s)
	consonants = ["A","E","I","O","U"]
	s.upcase!
	if s == '' || s =~ /\W/
		return false
	elsif !consonants.include?(s[0])
		return true
	else
		return false
	end
end

def binary_multiple_of_4?(s)
	if s =~ /^[10]*00$/ || s =~ /^0{1}/
		return true
	else
		return false
	end
end
# puts hello("Richard")
# puts starts_with_consonant?("dhdh")
# puts binary_multiple_of_4?("10")