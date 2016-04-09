class GalleryPicture < Picture
  mount_uploader :resource, GalleryUploader

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

  scope :sorted, -> { where.not(sort_id: nil).order('sort_id asc') }

end
