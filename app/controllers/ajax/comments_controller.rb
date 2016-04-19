module Ajax
  class CommentsController < BaseController
    def destroy
      @comment = Comment.find(params[:id])
      @comment.delete
      @comment.children.each(&:delete)
    end
  end
end
