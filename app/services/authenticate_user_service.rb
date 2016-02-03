class AuthenticateUserService
  include Serviceable
  include StatusObject

  def initialize(user, password)
    @user = user
    @password = password
  end

  def call
    unless @user.present? && @user.valid_password?(@password)
      return Status.new(success: false, alert: '邮箱或密码错误')
    end
    return Status.new(success: false, alert: '帐号未激活，请先进入邮箱激活') unless @user.status
    Status.new(success: true)
  end

end
