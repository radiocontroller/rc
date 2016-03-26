class VideosController < BaseController
  before_action :set_limit, only: [:index]

  def index
    set_videos
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

    def set_videos
      @videos = VideoType::ID_TYPES.map do |type_id, type_name|
                  {
                    type: type_name,
                    english_type: VideoType.find_english_type_by(type_id),
                    lists: Video.videos_by(type_id).order('id desc').limit(@limit)
                  }
                end
    end
end
