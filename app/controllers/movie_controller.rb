class MovieController < ApplicationController
  def search
    unless params[:title].empty?
      @movies = SearchMovie.new(search_params[:title]).perform
    end
  end
  
  private
  def search_params
    params.permit(:title)
  end
end
