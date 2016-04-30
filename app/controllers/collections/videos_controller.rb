class Collections::VideosController < Collections::BaseController
  before_action :set_user

  def index
    @videos = @user.video_ids.map { |id| Video.normal.find(id) }
  end

end
