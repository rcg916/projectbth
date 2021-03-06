 class BarsController < ApplicationController

 	before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

 	def index
 		@bars = Bar.all.sort_by{ |t| [t.state, t.city] }
 	end

	def show
		@bar = Bar.find(params[:id])
		@brand = Brand.new
		@photo = Photo.new
		@favoritebar_exists = Favoritebar.where(bar: @bar, user: current_user) == [] ? false : true
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
		if current_user.admin?
			@bar = Bar.new
		else
			redirect_to root_path
		end
	end

	def edit
		if current_user.admin?
			@bar = Bar.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def update
	  @bar = Bar.find(params[:id])
	  @bar.update_attributes(bar_params)
	  @temp = []
		@bar.attributes.except("id", "created_at", "updated_at", "name", "description", "address", 
			"latitude", "longitude", "city", "state", "zipcode").each do |name, value|
			if value == true
			  @temp << name
			end	
		end
		@bar.update_attribute :activities, @temp
	  redirect_to bar_path(@bar)
	end

	def destroy
	  @bar = Bar.find(params[:id])
	  favorites = Favoritebar.where(bar: @bar)
	  favorites.destroy_all
	  @bar.destroy
	  redirect_to root_path
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
    	:dancing, :food, :beer, :vodka, :whiskey, :wine, :sportstv, :tequila, :happyhour, :cocktails, :websiteurl)
  end
end
