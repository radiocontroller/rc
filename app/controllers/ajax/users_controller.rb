module Ajax
  class UsersController < BaseController
    before_action :set_user

    def update
      @user.toggle!
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
  end
end
