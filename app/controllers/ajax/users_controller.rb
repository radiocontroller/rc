module Ajax
  class UsersController < BaseController
    def update
      @user = User.find(params[:id])
      @user.toggle!
    end
  end
end
