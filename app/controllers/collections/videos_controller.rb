class Collections::VideosController < ActionController::Base
  layout 'user'

  def index
    @videos = current_user.video_ids.map { |id| Video.normal.find(id) }
  end

end
