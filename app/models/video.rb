class Video < ActiveRecord::Base
  mount_uploader :image, VideoUploader

  scope :normal, ->{ where(deleted: false) }

  scope :homepage, -> { find_by(is_homepage: true) }

  validates :description, :url, presence: true

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

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

  def homepage!
    previous = Video.normal.homepage
    previous.update(is_homepage: false) if previous.present?
    self.update(is_homepage: true)
  end

  def homepage?
    is_homepage.present?
  end

end