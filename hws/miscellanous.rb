class Numeric
	@@currencies = {'yen'=>0.013, 'euro'=>1.292, 'dop'=>43}
	def method_missing(method_id, *args, &block)#capture all args in case have to call super
		singular_currency = method_id.to_s.gsub(/s$/,'')
		if @@currencies.has_key?(singular_currency)
			puts self * @@currencies[singular_currency]
		else
			super
		end
	end
	def probando
		puts "Mi clase es:#{self.class}"
		puts "Caller es:#{caller}"
		puts "el numero es: #{self}"
	end
end

class Account
	# include spaceship comparable inside a class
	# defining comparisons
	include Comparable
	def <=>(other)
		self.balance <=> other.balance
	end
	def foo
	end
end

class Test < Account
	def foo
	  # ...
	  p self.class.superclass.instance_method(:foo).source_location
	  #OR...check its ancestors...
	  # self.class.ancestors.each do |klass|
   #  	next unless klass.method_defined?(:foo)
   #  	p klass.instance_method(:foo).source_location
 	 #  end
	  super
	  # ...
	end
end

# # to find where a method is defined...
# p 1.method(:method_missing).source_location
# p 1.method(:probando).source_location
# # to find who is calling a method...
# p caller
# p 1.probando
# # to find the name of the class
# p self.class
expressions = [ ")(){}", "[]({})", "([])", "{()[]}", "([)][]" ]
def check_braces(expressions)
	expressions.each do |exp|
		round, square, curly = 0,0,0
	    bs, br, bc = false, false, false
	    has = Hash.new(0)
		if ["}","]",")"].include?(exp.to_s.chars.first)
			puts 0
			next
		else
		for i in 0...exp.to_s.length
			case exp[i]
		        when "("
		          br = true
		          has[:round] = 1
		        when ")"
				  condition = ["{","["].include?(exp[i-1])
				  # puts "index: #{exp[i]}   condition: #{condition}"
		          round += 1 if br && !condition
		          br = false
		        when "{"
				  bc = true
				  has[:curly] = 1
		        when "}"
        		  condition = ["(","["].include?(exp[i-1])
  				  # puts "index: #{exp[i]}   condition: #{condition}"
		          curly += 1 if bc && !condition
		          bc = false
		        when "["
		          bs = true
		          has[:square] = 1
		        when "]"
		          condition = ["{","("].include?(exp[i-1])
		          # puts "index: #{exp[i]}   condition: #{condition}"
		          square += 1 if bs && !condition
		          bs = false
		        else
		    end
		end
		end
		# puts "round:#{round} curly: #{curly} square: #{square}"
		# puts "has: #{has}"

		valid = true
	    if has[:round] > 0 && round == 0
	        valid = false
	    end
	    if has[:curly] > 0 && curly == 0
	        valid = false
	    end
	    if has[:square] > 0 && square == 0
	        valid = false
	    end
        puts valid == true ? 1 : 0
	end
end
check_braces(expressions)