class Movie < ApplicationRecord
  has_many :reviews

  def self.movies_alphabetical
    order(:title)
  end

  def most_favorited_book
    reviews.order(:rating)
  end
end
