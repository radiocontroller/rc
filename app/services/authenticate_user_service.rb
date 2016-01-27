class AuthenticateUserService
  include Serviceable
  include StatusObject

  def initialize(user, password)
    @user = user
    @password = password
  end

  def call
    unless @user.present? && @user.valid_password?(@password)
      return Status.new(success: false, notice: '邮箱或密码错误')
    end
    return Status.new(success: false, notice: '帐号未激活，请进入邮箱激活') unless @user.status
    Status.new(success: true, notice: '登录成功')
  end

end
