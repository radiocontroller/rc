class Picture < ActiveRecord::Base

  mount_uploader :resource, PictureUploader

  enum category: [:banner, :fixed_wing, :glider, :helicopter, :fpv]

  ID_CATEGORIES = {
    0 => '首页横幅',
    1 => '固定翼',
    2 => '滑翔机',
    3 => '直升机',
    4 => '穿越机'
  }
end
