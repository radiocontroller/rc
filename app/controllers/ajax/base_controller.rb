module Ajax
  class BaseController < ActionController::Base
    layout false
    respond_to :js
    before_action :verify_admin

    private

      def verify_admin
        render :file => "/public/500.html", layout: false, status: 500 if !current_user.try(:admin?)
      end
  end
end
