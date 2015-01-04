module FunWithStrings
  def palindrome?
    letters = self.downcase.scan(/\w/)
    letters == letters.reverse
  end
  def count_words
    # your code here
    map = Hash.new(0)
    self.downcase.scan(/\w+/).each{|w| map[w]+=1}
    map
  end
  def anagram_groups
    # your code here
    self.split(' ').group_by { |element| element.downcase.chars.sort }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
p 'scream cars for four scar creams'.anagram_groups
puts "sixaxis".palindrome?
puts "A man, a plan, a canal -- Panama".palindrome?
puts "A man, a plan, a canal -- Panama".count_words
puts 'Doo bee doo bee doo'.count_words
