class Picture < ActiveRecord::Base

  mount_uploader :resource, PictureUploader

  enum category: [:homepage, :fixed_wing, :glider, :helicopter, :fpv]
end
