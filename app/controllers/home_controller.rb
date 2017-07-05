class HomeController < ApplicationController
  def index
    @photos = Photo.all
    @five_most_recent = Photo.five_most_recent
  end
end
