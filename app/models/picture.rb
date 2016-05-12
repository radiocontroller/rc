class Picture < ActiveRecord::Base
  validates :resource, presence: true

  scope :normal, -> { where(deleted: false) }

  def remove!
    update(deleted: true)
  end

  def deleted?
    deleted
  end
end
