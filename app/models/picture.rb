class Picture < ActiveRecord::Base

  mount_uploader :resource, PictureUploader

  belongs_to :imageable, polymorphic: true
end
