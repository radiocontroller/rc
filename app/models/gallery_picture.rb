class GalleryPicture < Picture
  mount_uploader :resource, GalleryUploader

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]
end
