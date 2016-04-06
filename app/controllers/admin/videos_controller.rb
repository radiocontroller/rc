module Admin
  class VideosController < BaseController

    def index
      q = Video.normal.ransack(params[:q])
      @videos = q.result(distinct: true).order(created_at: :desc)
      set_search_values
      @types = Video::ID_CATEGORIES.invert.to_a
    end

    private

      def set_search_values
        params[:q] ||= {}
        @search = {
          category: params[:q][:category_eq],
          description: params[:q][:description_cont]
        }
      end

  end
end
