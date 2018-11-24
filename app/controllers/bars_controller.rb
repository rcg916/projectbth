 class BarsController < ApplicationController
	def show
		@bar = Bar.find(params[:id])
		@brand = Brand.new
	end

	def results
		@userlocation = Userlocation.last
		@geocodeduserlocation = Geocoder.search(@userlocation.searchterm)
		if @userlocation.withindistance != nil
			@withindistance = @userlocation.withindistance
		else
			@withindistance = 20.0
		end
		@nearbybars = Bar.near(@geocodeduserlocation.last.coordinates, @withindistance, units: :mi)
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
		@temp = []
		Bar.last.attributes.except("id", "created_at", "updated_at", "name", "description", "address",
		 "latitude", "longitude", "city", "state", "zipcode").each do |name, value|
			if value == true
			  @temp << name
			end	
		end
		Bar.last.update_attribute :activities, @temp
    redirect_to results_path
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :address, :description, :livemusic, :pool, :darts, :cornhole, :karaoke, 
    	:dancing, :food)
  end
end
