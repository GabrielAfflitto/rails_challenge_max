class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  enum rating: ["non-favorite", "favorite"]
end
