class UserlocationsController < ApplicationController
	def search
		@userlocation = Userlocation.new
	end

	def create
    Userlocation.create(userlocation_params)
    redirect_to results_path
  end

  private

  def userlocation_params
    params.require(:userlocation).permit(:searchterm)
  end
end
