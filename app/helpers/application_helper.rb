module ApplicationHelper
  def has_collected?(resource)
    return '-o' if current_user.blank? || !current_user.has_collected?(resource)
  end

  def has_commented?(resource)
    return '-o' if current_user.blank? || !current_user.has_commented?(resource)
  end

  def login?
    return 'js-collect cursor-pointer' if current_user.present?
  end

end
