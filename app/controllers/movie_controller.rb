class MovieController < ApplicationController
  def search
    if params[:title] && !params[:title].empty?
      @movies = SearchMovie.new(search_params[:title]).perform
    end
  end
  
  private
  def search_params
    params.permit(:title)
  end
end
