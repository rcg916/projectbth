class BarsController < ApplicationController
	def results
		@userlocation = Userlocation.last
	end

	def new
		@bar = Bar.new
	end

	def create
    Bar.create(bar_params)
    redirect_to results_path
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :address, :description)
  end
end
