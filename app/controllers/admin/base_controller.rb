module Admin
  class BaseController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'admin'

    before_action :authenticate_user!
    before_filter :verify_admin

    private

      def verify_admin
        redirect_to root_path if !current_user.admin?
      end
  end
end
