class UserlocationsController < ApplicationController
	def search
		@userlocation = Userlocation.new
	end

	def create
    Userlocation.create(userlocation_params)
    @temp = []
    Userlocation.last.attributes.except("id", "created_at", "updated_at", "withindistance").each do |name, value|
      if value == true
        @temp << name
      end 
    end
    Userlocation.last.update_attribute :wantedactivities, @temp
    redirect_to results_path
  end

  private

  def userlocation_params
    params.require(:userlocation).permit(:searchterm, :withindistance, :livemusic, :pool, :darts, :cornhole, 
      :karaoke, :dancing, :food, :beer, :vodka, :whiskey, :wine, :sportstv, :tequila, :happyhour, :cocktails)
  end
end
