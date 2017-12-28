require 'rails_helper'

describe "user can visit movie index" do
  before(:each) do
    @movie = Movie.create!(title: "Kill Bill", description: "Badass revenge flick")
    @movie2 = Movie.create!(title: "Reservoir Dogs", description: "Heist gone wrong")
    @movie3 = Movie.create!(title: "Pulp Fiction", description: "Crime stories")
    @movie4 = Movie.create!(title: "Django: Unchained", description: "Freed slave revenge")
    @user = User.create!(name: "Gabe")
    @review = @user.reviews.create!(rating: 1, movie: @movie)
    @review2 = @user2.reviews.create!(rating: 1, movie: @movie)
    @review3 = @user3.reviews.create!(rating: 1, movie: @movie)
    @user2 = User.create!(name: "Bill")
    @review4 = @user.reviews.create!(rating: 0, movie: @movie2)
    @review5 = @user2.reviews.create!(rating: 1, movie: @movie2)
    @review6 = @user3.reviews.create!(rating: 0, movie: @movie2)
    @user3 = User.create!(name: "Jill")
    visit movies_path
  end

  it "should show all movies in alphabetical order by title" do
    expect(@movie).to appear_before(@movie2)
    expect(@movie2).to appear_before(@movie3)
    expect(@movie3).to appear_before(@movie4)
  end

  it "should show the most favorited movie in a header" do
    within ".favorite-movie" do
      expect(page).to have_content("The most favorited movie is Kill Bill")
    end
  end
end
