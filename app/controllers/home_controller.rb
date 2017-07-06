class HomeController < ApplicationController
  def index
    @photos = Photo.all
    @six_most_recent = Photo.six_most_recent
    @six_highest_rated = Photo.six_highest_rated
  end
end
