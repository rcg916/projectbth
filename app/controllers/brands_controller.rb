class BrandsController < ApplicationController
	def create
    @bar = Bar.find(params[:bar_id])
    @bar.brands.create(brand_params)
    redirect_to bar_path(@bar)
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :brandtype)
  end
end
