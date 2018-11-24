Rails.application.routes.draw do
	root 'userlocations#search'
	resources :userlocations, only: :create
	resources :bars do
		resources :brands, only: :create
	end
	get '/results', to: 'bars#results'
end
