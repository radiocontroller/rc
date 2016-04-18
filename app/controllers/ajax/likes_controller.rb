module Ajax
  class LikesController < BaseController
    def create
      column, resource_id = resource_params
      if current_user.send(column).include?(resource_id)
        current_user.send(column).delete(resource_id)
        modal.update(user_ids: modal.user_ids.reject{|id| id == current_user.id})
      else
        current_user.send(column) << resource_id
        modal.update(user_ids: modal.user_ids.push(current_user.id))
      end
      current_user.save
    end

    private

      def resource_params
        params[:video_id].present? ? [:video_ids, params[:video_id].to_i] : [:article_ids, params[:article_id].to_i]
      end

      def modal
        params[:video_id].present? ? Video.normal.find(params[:video_id]) : Article.find(params[:article_id])
      end

  end
end
