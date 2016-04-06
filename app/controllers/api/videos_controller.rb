module Api
  class VideosController < BaseController
    before_action :set_video

    def update
      @video.update(description: params[:description], url: params[:url])
    end

    def destroy
      @video.remove!
    end

    private

      def set_video
        @video = Video.normal.find(params[:id])
      end

  end
end
