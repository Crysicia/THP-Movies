Rails.application.routes.draw do
  root 'movie#search'
  get 'search', to: 'movie#search'
end
