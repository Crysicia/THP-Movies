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
      hash = {}
      hash['title'] = movie['title']
      hash['release'] = movie['release_date']
      hash['director'] = director(movie['id'].to_i)
      hash['poster'] = movie['poster_path'] != nil ? @baseurl + movie['poster_path'] : 'https://via.placeholder.com/200x300'
      array << hash
    end
    array
  end
  
  def director(id)
    credits = Tmdb::Movie.credits(id)
    director = credits['crew'].select{ |member| member['job'] == 'Director'}
    unless director.empty?
      director[0]['name']
    end  
  end
end