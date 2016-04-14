class BattlePlane < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }
end
