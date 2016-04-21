module Admin
  module Gallery
    class BaseController < ActionController::Base
      before_action :verify_admin

      private

        def verify_admin
          redirect_to root_path if !current_user.try(:admin?)
        end

        def parse_name(action)
          case action
          when 'index'
            '列表'
          when 'new'
            '新建'
          when 'edit'
            '编辑'
          when 'show'
            '详情'
          end
        end
    end
  end
end
