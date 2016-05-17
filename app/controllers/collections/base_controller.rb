class Collections::BaseController < ActionController::Base
  layout 'user'

  private

    def set_user
      @user = User.find(params[:user_id])
    end
end
