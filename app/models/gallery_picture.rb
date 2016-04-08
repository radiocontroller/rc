class GalleryPicture < Picture
  mount_uploader :resource, GalleryUploader

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

end
