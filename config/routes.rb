Rails.application.routes.draw do
  devise_for :users
	root 'userlocations#search'
	resources :userlocations, only: :create
	resources :bars do
		resources :brands, only: :create
		resources :photos, only: :create
	end
	get '/results', to: 'bars#results'
end
