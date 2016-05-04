module Ajax
  class CommentsController < BaseController
    def destroy
      @comment = Comment.find(params[:id])
      @comment.remove!
      @comment.children.each(&:remove!)
    end
  end
end
