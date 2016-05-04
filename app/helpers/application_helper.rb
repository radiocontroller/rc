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

end
