class VideosController < BaseController
  before_action :set_limit, only: [:index]
  before_action :set_videos, :set_search_value, only: [:fixed_wing, :helicopter, :fpv, :glider]
  before_action :set_video, only: [:update]

  def index
    set_categories
  end

  def show
  end

  def fixed_wing
  end

  def helicopter
  end

  def fpv
  end

  def glider
  end

  private

    def set_limit
      @limit = 4
    end

    def set_categories
      @categories = Video::CATEGORIES.map do |english, chinese|
                  {
                    chinese: chinese,
                    english: english,
                    videos: Video.normal.send(english).order('id desc').limit(@limit)
                  }
               end
    end

    def set_videos
      q = Video.send(action_name.to_sym).ransack(params[:q])
      @videos = q.result(distinct: true).order("id desc")
    end

    def set_search_value
      params[:q] ||= {}
      @search = params[:q][:description_cont]
    end

end
