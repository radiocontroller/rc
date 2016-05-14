module BaseModel
  extend ActiveSupport::Concern

  included do
    scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }

    scope :normal, -> { where(deleted: false) }
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
