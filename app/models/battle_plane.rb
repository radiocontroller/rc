class BattlePlane < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }

  def empty_order!
    update(sort_id: nil)
  end

  def set_order!(sort_id)
    update(sort_id: sort_id)
  end
end
