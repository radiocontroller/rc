class Article < ActiveRecord::Base
  scope :homepage, -> { find_by(is_homepage: true) }

  has_many :comments, as: :commentable

  def user_quantity
    user_ids.count
  end
end
