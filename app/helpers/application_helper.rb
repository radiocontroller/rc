module ApplicationHelper
  def has_collected?(resource)
    return '-o' if current_user.blank? || !current_user.has_collected?(resource)
  end

  def has_commented?(resource)
    return '-o' if current_user.blank? || !current_user.has_commented?(resource)
  end

  def comment_title(comment)
    comment.commentable_type == 'Article' ? '[文章]' : '[视频]'
  end

  def options(name)
    @limit.times.map do |i|
      ["首页第#{i+1}#{name}", i+1]
    end
  end

  def flash_message
    flash[:notice].present? ? flash[:notice] : flash[:alert]
  end

  def flash_style
    flash[:notice].present? ? "notice" : "alert"
  end

end
