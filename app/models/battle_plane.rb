class BattlePlane < ActiveRecord::Base
  include BaseModel

  validates :title, :content, presence: true
  validates :title, uniqueness: true

  after_commit :empty_order

  def empty_order
    BattlePlane.normal.where(sort_id: self.sort_id).where.not(id: self.id).each(&:empty_order!)
  end

end
