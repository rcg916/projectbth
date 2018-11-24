class PhotosController < ApplicationController

	def create
    @bar = Bar.find(params[:bar_id])
    @bar.photos.create(photo_params)
    redirect_to bar_path(@bar)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end
end
