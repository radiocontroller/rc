class Video < ActiveRecord::Base
  include BaseModel

  mount_uploader :image, VideoUploader

  scope :homepage, -> { find_by(is_homepage: true) }

  validates :title, :url, :image, presence: true

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

  has_many :comments, as: :commentable

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

  def free_homepage!
    update(is_homepage: false)
  end

  def free_previous_homepage
    Video.normal.homepage.try(:free_homepage!)
  end

  def homepage!
    return if self.homepage?
    free_previous_homepage
    self.update(is_homepage: true)
  end

  def homepage?
    is_homepage
  end

  def comment_quantity
    comments.count
  end

  def parent_comments
    comments.where(parent_id: nil).order('id desc')
  end

  def collect_quantity
    user_ids.count
  end

  def remove_user_id!(id)
    update(user_ids: self.user_ids.reject{|id| id == id})
  end

  def add_user_id!(id)
    update(user_ids: self.user_ids.push(id))
  end

end
