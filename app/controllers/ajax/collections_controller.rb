module Ajax
  class CollectionsController < BaseController
    before_action :set_attrs

    def create
      collect_resource
    end

    private

      def set_attrs
        if params[:video_id].present?
          @column = :video_ids
          @resource = Video.normal.find(params[:video_id])
        else
          @column = :article_ids
          @resource = Article.find(params[:article_id])
        end
      end

      def collect_resource
        if current_user.read_attribute(@column).delete(@resource.id).present?
          @resource.remove_user_id!(current_user.id)
        else
          current_user.read_attribute(@column).push(@resource.id)
          @resource.add_user_id!(current_user.id)
        end
        current_user.save
      end

  end
end
