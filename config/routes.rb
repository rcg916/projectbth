Rails.application.routes.draw do
  get 'favoritebars/update'
  devise_for :users
	root 'userlocations#search'
	resources :userlocations, only: :create
	resources :bars do
		resources :brands, only: [:create, :destroy]
		resources :photos, only: :create
	end
	get '/results', to: 'bars#results'
	resources :users, only: :show
	get '/help', to: 'userlocations#help'
end
