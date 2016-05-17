class Article < ActiveRecord::Base
  include BaseModel

  validates :title, :content, presence: true

  has_many :comments, as: :commentable

  def collect_quantity
    user_ids.count
  end

  def comment_quantity
    comments.normal.count
  end

  def parent_comments
    comments.where(parent_id: nil).order('id desc')
  end

  def remove_user_id!(id)
    update(user_ids: self.user_ids.reject{|id| id == id})
  end

  def add_user_id!(id)
    update(user_ids: self.user_ids.push(id))
  end

end
