class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :children, class_name: 'Comment', foreign_key: 'parent_id'
end
