class Video < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  scope :videos_by, ->(type_id){ where(type_id: type_id) }
end
