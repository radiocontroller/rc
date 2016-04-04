module Api
  class VideosController < BaseController

    def destroy
      @video = Video.normal.find(params[:id])
      @video.remove!
    end

  end
end
