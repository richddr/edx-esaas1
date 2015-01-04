class Movie < ActiveRecord::Base
	attr_accessible :director
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end
