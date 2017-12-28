require 'rails_helper'

describe "user can visit movie index" do
  before(:each) do
    @movie = Movie.create!(title: "Kill Bill", description: "Badass revenge flick")
    @movie2 = Movie.create!(title: "Reservoir Dogs", description: "Heist gone wrong")
    @movie3 = Movie.create!(title: "Pulp Fiction", description: "Crime stories")
    @user = User.create!(name: "Gabe")
    @user2 = User.create!(name: "Bill")
    @user3 = User.create!(name: "Jill")
    @review = @user.reviews.create!(rating: 1, movie: @movie)
    @review2 = @user2.reviews.create!(rating: 1, movie: @movie)
    @review3 = @user3.reviews.create!(rating: 1, movie: @movie)
    @review4 = @user.reviews.create!(rating: 0, movie: @movie2)
    @review5 = @user2.reviews.create!(rating: 1, movie: @movie2)
    @review6 = @user3.reviews.create!(rating: 1, movie: @movie2)
    @review7 = @user.reviews.create!(rating: 0, movie: @movie3)
    @review8 = @user2.reviews.create!(rating: 0, movie: @movie3)
    @review9 = @user3.reviews.create!(rating: 0, movie: @movie3)

    visit movies_path
  end

  it "should show all movies in alphabetical order by title" do
    expect(@movie.title).to appear_before(@movie3.title)
    expect(@movie3.title).to appear_before(@movie2.title)
  end

  it "should show the most favorited movie in a header" do
    within ".favorite-movie" do
      expect(page).to have_content("The most favorited movie is Kill Bill")
      expect(page).to have_content("Badass revenge flick")
      expect(page).to have_content("Favorited by 3 users")
    end
  end

  xit "should show the least favorited movie in a header" do
    within ".least-favorite" do
      expect(page).to have_content("The least favorited movie is Pulp Fiction")
      expect(page).to have_content("Crime stories")
      expect(page).to have_content("Favorited by 3 users")
    end
  end
end
