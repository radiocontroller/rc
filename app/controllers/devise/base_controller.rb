class Devise::BaseController < ApplicationController
  layout 'accounts'

  protect_from_forgery with: :exception

  before_action :verify_user_present, only: [:new]

  private

    def verify_user_present
      redirect_to root_path if current_user.present?
    end

end
