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
    return Status.new(success: false, alert: "帐号已被限制登录至#{@user.free_at.strftime('%Y年%m月%d日 %H:%M:%S')}") if @user.try(:limit?)
    return Status.new(success: false, alert: '帐号未验证,请进入注册邮箱验证') if !@user.try(:confirmed?)
    Status.new(success: true)
  end

end
