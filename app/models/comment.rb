class Comment < ActiveRecord::Base
  include BaseModel

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :children, class_name: 'Comment', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Comment', foreign_key: 'parent_id'

end
