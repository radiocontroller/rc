class UsersController < ApplicationController
  layout 'user'

  def show
    @user = User.find(params[:id])
  end

end
