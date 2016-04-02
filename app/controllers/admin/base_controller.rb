module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_filter :verify_admin

    private

      def verify_admin
        redirect_to root_path if !current_user.admin?
      end
  end
end
