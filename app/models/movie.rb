class Movie < ApplicationRecord
  has_many :reviews

  def self.movies_alphabetical
    order(:title)
  end

  def self.most_favorited_book
    
  end
end
