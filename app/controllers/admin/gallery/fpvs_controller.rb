class Admin::Gallery::FpvsController < Admin::BaseController
  include GalleryAble

  def chinese_category
    '穿越机'
  end

  def english_category
    'fpv'
  end

end
