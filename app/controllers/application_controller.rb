class ApplicationController < ActionController::Base
	def favoritebar_text
		return @favoritebar_exists ? "Remove from Favorites" : "Add to Favorites"
	end

	helper_method :favoritebar_text
end
