class BarsController < ApplicationController
	def results
		@userlocation = Userlocation.last
		@geocodeduserlocation = Geocoder.search(@userlocation.searchterm)
		@nearbybars = Bar.near(@geocodeduserlocation.last.coordinates) # temporary
	end

	def new
		@bar = Bar.new
	end

	def create
    Bar.create(bar_params)
    @city = Bar.last.address.split(', ')[1]
    Bar.last.update_attribute :city, @city
    sp1 = Bar.last.address.split(', ')[2]
		@state = sp1.split(" ")[0]
		@zipcode = sp1.split(" ")[1]
		Bar.last.update_attribute :state, @state
		Bar.last.update_attribute :zipcode, @zipcode
    redirect_to results_path
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :address, :description)
  end
end
