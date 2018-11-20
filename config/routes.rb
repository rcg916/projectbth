Rails.application.routes.draw do
	root 'userlocations#search'
	resources :userlocations, only: [:create]
	resources :bars
	get '/results', to: 'bars#results'
end
