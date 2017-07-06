class HomeController < ApplicationController
  def index
    # Photo.all.each do |photo|
    #   photo.avg_rating = Photo.get_avg_rating(photo)
    #   photo.save
    # end
    
    @six_most_recent = Photo.six_most_recent
    @six_highest_rated = Photo.six_highest_rated
  end
end
