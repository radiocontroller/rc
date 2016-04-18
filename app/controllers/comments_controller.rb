class CommentsController < BaseController
  def create
    video = Video.normal.find(params[:video_id])
    video.comments.create(content: params[:content], user_id: current_user.id)
    redirect_to video_path(video)
  end
end
