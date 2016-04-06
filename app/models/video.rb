class Video < ActiveRecord::Base

  mount_uploader :image, VideoImageUploader

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

  scope :videos_by, ->(type_id){ where(type_id: type_id) }

  scope :normal, ->{ where(deleted: false) }

  CATEGORIES = {
    'fixed_wing': '固定翼',
    'glider': '滑翔机',
    'helicopter': '直升机',
    'fpv': '穿越机'
  }

  ID_CATEGORIES = {
    0 => '固定翼',
    1 => '滑翔机',
    2 => '直升机',
    3 => '穿越机'
  }

  def remove!
    self.update(deleted: true)
  end

  def deleted?
    deleted
  end

end
