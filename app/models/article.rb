class Article < ActiveRecord::Base
  scope :homepage, -> { find_by(is_homepage: true) }

  has_many :comments, as: :commentable

  def user_quantity
    user_ids.count
  end

  def remove_user_id!(id)
    update(user_ids: self.user_ids.reject{|id| id == id})
  end

  def add_user_id!(id)
    update(user_ids: self.user_ids.push(id))
  end
end
