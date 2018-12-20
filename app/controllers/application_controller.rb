class ApplicationController < ActionController::Base
	def favoritebar_text
		return @favoritebar_exists ? "UnFavorite" : "Favorite"
	end

	helper_method :favoritebar_text
end
