class GalleryPicture < Picture
  mount_uploader :resource, GalleryUploader

  enum category: [:fixed_wing, :glider, :helicopter, :fpv]

  CATEGORIES = {
    'fixed_wing' => '固定翼',
    'glider' => '滑翔机',
    'helicopter' => '直升机',
    'fpv' => '穿越机'
  }

  after_commit :empty_order

  def empty_order
    pictures = GalleryPicture.normal.send(self.category.to_sym)
    pictures.where(sort_id: self.sort_id).where.not(id: self.id).each(&:empty_order!)
  end
  
end
