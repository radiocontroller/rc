module Ajax
  class VideosController < BaseController

    def destroy
      @video = Video.normal.find(params[:id])
      @video.remove!
    end

    def update
      @video = Video.normal.find(params[:id])
      @video.homepage!
    end
  end
end
