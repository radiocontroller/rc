class Collections::BaseController < ActionController::Base
  layout 'user'
  before_action :set_user

  private

    def set_user
      @user = User.find(params[:user_id])
    end
end
