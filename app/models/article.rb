class Article < ActiveRecord::Base
  scope :homepage, -> { find_by(is_homepage: true) }

  has_many :comments, as: :commentable
end
