class Collections::VideosController < ActionController::Base
  layout 'application'

  def index
    @videos = current_user.video_ids.map { |id| Video.normal.find(id) }
  end

end
