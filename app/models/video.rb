class Video < ActiveRecord::Base
  include BaseModel

  mount_uploader :image, VideoUploader

  scope :homepage, -> { find_by(is_homepage: true) }

  validates :title, :url, :image, presence: true
  validates :title, uniqueness: { scope: :deleted }

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

  has_many :comments, as: :commentable

  after_commit :empty_order, :free_homepage

  CATEGORIES = {
    'fixed_wing' => '固定翼',
    'glider' => '滑翔机',
    'helicopter' => '直升机',
    'fpv' => '穿越机'
  }

  ID_CATEGORIES = {
    0 => '固定翼',
    1 => '滑翔机',
    2 => '直升机',
    3 => '穿越机'
  }

  def empty_order
    Video.normal.send(self.category).where(sort_id: self.sort_id).where.not(id: self.id).each(&:empty_order!)
  end

  def free_homepage
    Video.normal.where(is_homepage: true).where.not(id: self.id).each(&:free_homepage!) if homepage?
  end

  def free_homepage!
    update_column(:is_homepage, nil)
  end

  def homepage?
    is_homepage
  end

  def sorted?
    sort_id.present?
  end

  def comment_quantity
    comments.normal.count
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
