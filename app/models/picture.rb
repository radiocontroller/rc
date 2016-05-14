class Picture < ActiveRecord::Base
  include BaseModel

  validates :resource, presence: true

end
