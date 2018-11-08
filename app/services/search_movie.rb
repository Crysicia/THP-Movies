class SearchMovie
  def initialize(query)
    @query = query
    @baseurl = 'http://image.tmdb.org/t/p/w200/'
    Tmdb::Api.key(Rails.application.credentials.moviedb)
  end
  
  def perform
     search(@query)
  end
  
  private
  
  def search(query)
    array = []
    @search = Tmdb::Search.new
    @search.resource('movie')
    @search.query(query)
    results = @search.fetch
    results.each do |movie|
      p "IM SCRAPPING"
      hash = {}
      hash['title'] = movie['title']
      hash['release'] = movie['release_date']
      hash['director'] = director(movie['id'].to_i)
      hash['poster'] = @baseurl + movie['poster_path']
      array << hash
    end
    array
  end
  
  def director(id)
    credits = Tmdb::Movie.credits(id)
    credits['crew'].select{ |member| member['job'] == 'Director'}[0]['name']
  end
end