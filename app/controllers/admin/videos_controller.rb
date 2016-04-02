module Admin
  class VideosController < BaseController

    def index
      q = Video.ransack(params[:q])
      @videos = q.result(distinct: true).order(created_at: :desc)
    end

  end
end
