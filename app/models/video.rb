class Video < ActiveRecord::Base

  mount_uploader :image, VideoImageUploader

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

  scope :videos_by, ->(type_id){ where(type_id: type_id) }

  CATEGORIES = {
    'fixed_wing': '固定翼',
    'glider': '滑翔机',
    'helicopter': '直升机',
    'fpv': '穿越机'
  }

  def chinese_category
    CATEGORIES[self.category]
  end

end
