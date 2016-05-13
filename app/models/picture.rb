class Picture < ActiveRecord::Base
  validates :resource, presence: true

  scope :normal, -> { where(deleted: false) }

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }

  def remove!
    update(deleted: true)
  end

  def deleted?
    deleted
  end

  def empty_order!
    update_column(:sort_id, nil)
  end
end
