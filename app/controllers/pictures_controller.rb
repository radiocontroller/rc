class PicturesController < BaseController

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to new_picture_path
  end

  private

    def picture_params
      params.require(:picture).permit(:description, :resource)
    end
end
