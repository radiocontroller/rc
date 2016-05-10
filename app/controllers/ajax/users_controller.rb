module Ajax
  class UsersController < BaseController
    before_action :set_user

    def update
      if !@user.admin? && User.admins.count >= admin_limit
        @user.errors.add(:toggle, "管理员数量已达上限")
      else
        @user.toggle!
      end
    end

    def release
      @user.release!
    end

    def limit
      @user.limit!(params[:days])
    end

    private

      def set_user
        @user = User.find(params[:id])
      end

      def admin_limit
        3
      end
  end
end
