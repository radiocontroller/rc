class VideosController < BaseController
  before_action :set_limit, only: [:index]
  before_action :set_videos, only: [:fixed_wing, :helicopter, :fpv, :glider]

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

    def set_video
      @video = Video.normal.find(params[:id])
    end

    def set_categories
      @categories = Video::CATEGORIES.map do |english, chinese|
                  {
                    chinese: chinese,
                    english: english,
                    videos: Video.normal.send(english.to_sym).order('id desc').limit(@limit)
                  }
               end
    end

    def set_videos
      @videos = Video.send(action_name.to_sym)
    end

end
