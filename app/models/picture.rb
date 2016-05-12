class Picture < ActiveRecord::Base
  validates :resource, presence: true

  def remove!
    update(deleted: true)
  end

  def deleted?
    deleted
  end
end
