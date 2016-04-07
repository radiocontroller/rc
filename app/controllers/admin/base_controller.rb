module Admin
  class BaseController < ActionController::Base
    before_action :verify_admin

    private

      def verify_admin
        redirect_to root_path if !current_user.try(:admin?)
      end
  end
end
