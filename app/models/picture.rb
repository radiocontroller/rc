class Picture < ActiveRecord::Base
  validates :resource, presence: true
end
