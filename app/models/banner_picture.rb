class BannerPicture < Picture
  mount_uploader :resource, BannerUploader

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }
end