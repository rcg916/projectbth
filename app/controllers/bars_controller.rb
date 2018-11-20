class BarsController < ApplicationController
	def results
		@userlocation = Userlocation.last
	end
end
