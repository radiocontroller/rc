class Admin::Gallery::GlidersController < Admin::BaseController
  include GalleryAble

  def chinese_category
    '滑翔机'
  end

  def english_category
    'glider'
  end

end
