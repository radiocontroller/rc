class CommentsController < BaseController
  def create
    video = Video.normal.find(params[:video_id])
    video.comments.create(video_params)
    redirect_to video_path(video)
  end

  private
  
    def video_params
      { content: params[:content], parent_id: params[:parent_id], user_id: current_user.id }
    end
end
