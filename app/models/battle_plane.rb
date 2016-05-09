class BattlePlane < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }

  scope :normal, -> { where(deleted: false) }

  def empty_order!
    update(sort_id: nil)
  end

  def remove!
    update(deleted: true)
  end

  def deleted?
    deleted
  end
end
