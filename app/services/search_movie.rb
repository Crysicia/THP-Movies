class SearchMovie
  def initialize(query)
    @query = query
    Tmdb::Api.key(Rails.application.credentials.moviedb)
  end
  
  def perform
    search(@query)
  end
  
  private
  
  def search(query)
    @search = Tmdb::Search.new
    @search.resource('movie') # determines type of resource
    @search.query(query) # the query to search against
    results = @search.fetch # makes request
    results.each do |movie|
      puts movie['title']
      puts movie['release_date']
      puts director(movie['id'].to_i)
    end
  end
  
  def director(id)
    credits = Tmdb::Movie.credits(id)
    credits['crew'][1]['name']
  end
end