class Article < ActiveRecord::Base
  scope :normal, -> { where(deleted: false) }

  scope :homepage, -> { find_by(is_homepage: true) }

  validates :title, :content, presence: true

  has_many :comments, as: :commentable

  def collect_quantity
    user_ids.count
  end

  def remove_user_id!(id)
    update(user_ids: self.user_ids.reject{|id| id == id})
  end

  def add_user_id!(id)
    update(user_ids: self.user_ids.push(id))
  end
end
