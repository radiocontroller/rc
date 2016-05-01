class UsersController < BaseController
  layout 'user'

  def show
    @user = User.find(params[:id])
  end

end
