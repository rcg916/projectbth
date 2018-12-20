class FavoritebarsController < ApplicationController
  def update
  	favoritebar = Favoritebar.where(bar: Bar.find(params[:bar]), user: current_user)
  	if favoritebar == []
  		# Create favoritebar
  		Favoritebar.create(bar: Bar.find(params[:bar]), user: current_user)
  		@favoritebar_exists = true
  	else
  		# Delete favoritebar(s)
  		favoritebar.destroy_all
  		@favoritebar_exists = false
  	end
  	respond_to do |format|
  		format.html {}
  		format.js {}
  	end
  end
end
