class AuthenticateUserService
  include Serviceable
  include StatusObject

  def initialize(user, password)
    @user = user
    @password = password
  end

  def call
    return Status.new(success: false, alert: '邮箱或密码错误') if @user.blank?
    return Status.new(success: false, alert: '邮箱或密码错误') if !@user.valid_password?(@password)
    return Status.new(success: false, alert: '该帐号已被限制登录') if @user.try(:deleted)
    return Status.new(success: false, alert: '帐号未激活，请先进入邮箱激活') if !@user.try(:status)
    Status.new(success: true)
  end

end
