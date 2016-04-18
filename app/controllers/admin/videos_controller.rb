module Admin
  class VideosController < BaseController
    layout 'admin'

    def index
      q = Video.normal.ransack(params[:q])
      @videos = q.result.order(created_at: :desc)
      set_search_values
      @categories = Video::ID_CATEGORIES.invert.to_a
    end

    def homepage
      @video = Video.normal.homepage
    end

    def new
      @video = Video.new
      @categories = Video::CATEGORIES.invert.to_a
    end

    def create
      redirect_to '/500' and return if !current_user.try(:admin?)
      if Video.create(video_params)
        redirect_to admin_videos_path
      else
        redirect_to new_admin_video_path
      end
    end

    def update
      video = Video.normal.find(params[:id])
      video_params = { description: params[:description], url: params[:url] }
      video_params.merge!(image: params[:image]) if params[:image].present?
      video.update video_params
      redirect_to admin_videos_path
    end

    private

      def set_search_values
        params[:q] ||= {}
        @search = {
          category: params[:q][:category_eq],
          description: params[:q][:description_cont]
        }
      end

      def video_params
        params.require(:video).permit(:description, :url, :image, :category)
      end

  end
end
