module Ajax
  class PicturesController < BaseController

    def destroy
      @picture = Picture.find(params[:id])
      @picture.remove!
    end

  end
end
