class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :children, class_name: 'Comment', foreign_key: 'parent_id'

  scope :normal, -> { where(deleted: false) }

  def remove!
    update(deleted: true)
  end

  def deleted?
    deleted
  end
end
