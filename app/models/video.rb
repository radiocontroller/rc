class Video < ActiveRecord::Base

  mount_uploader :image, ImageUploader
end
