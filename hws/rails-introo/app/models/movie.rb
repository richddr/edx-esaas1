class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date

  def self.ratings_list
    ratings = {}
    Movie.uniq.pluck(:rating).each{|m| ratings[m]=1}
    ratings
  end
end
