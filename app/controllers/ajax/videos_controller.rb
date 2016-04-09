module Ajax
  class VideosController < BaseController

    def destroy
      @video = Video.find(params[:id])
      @video.remove!
    end

  end
end
