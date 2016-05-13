class BattlePlane < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }

  scope :normal, -> { where(deleted: false) }

  after_commit :empty_order

  def empty_order
    BattlePlane.normal.where(sort_id: self.sort_id).where.not(id: self.id).each(&:empty_order!)
  end

  def empty_order!
    update_column(:sort_id, nil)
  end

  def remove!
    update(deleted: true)
  end

  def deleted?
    deleted
  end
end
