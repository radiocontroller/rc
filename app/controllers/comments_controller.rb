class CommentsController < ApplicationController
  before_action :verify_user
  before_action :set_resource

  def create
    @resource.comments.create(comment_params)
    redirect_to "/#{@resource.class.to_s.downcase.pluralize}/#{@resource.id}"
  end

  private

    def comment_params
      { content: params[:content], parent_id: params[:parent_id], user_id: current_user.id }
    end

    def set_resource
      @resource =  params[:video_id].present? ? Video.normal.find(params[:video_id]) : Article.normal.find(params[:article_id])
    end

    def verify_user
      render :file => "/public/500.html", layout: false, status: 500 if current_user.blank?
    end
end
