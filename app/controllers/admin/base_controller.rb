class Admin::BaseController < ActionController::Base
  layout 'admin'
  before_action :verify_admin
  before_action :set_page_nav

  private

    def verify_admin
      redirect_to root_path if !current_user.try(:admin?)
    end

end
