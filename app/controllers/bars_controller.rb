class BarsController < ApplicationController
	def show
		@bar = Bar.find(params[:id])
	end

	def results
		@userlocation = Userlocation.last
		@geocodeduserlocation = Geocoder.search(@userlocation.searchterm)
		@withindistance = @userlocation.withindistance
		@nearbybars = Bar.near(@geocodeduserlocation.last.coordinates, @withindistance, units: :mi) # temporary
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
    params.require(:bar).permit(:name, :address, :description, :livemusic, :pool, :darts)
  end
end
