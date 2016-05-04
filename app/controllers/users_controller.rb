class UsersController < ApplicationController
  layout 'user'
  before_action :set_user, only: [:show]
  before_action :set_page_nav

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '首页', url: '/' },
          { name: '用户', url: 'javascript:void(0)' },
          { name: @user.username, end: true }
        ]
      )
    end
end
