module Ajax
  class VideosController < BaseController

    def destroy
      @video.remove!
    end

  end
end
