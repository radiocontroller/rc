class BannerPicture < Picture
  mount_uploader :resource, BannerUploader

  after_commit :empty_order

  def empty_order
    BannerPicture.normal.where(sort_id: self.sort_id).where.not(id: self.id).each(&:empty_order!)
  end
end
