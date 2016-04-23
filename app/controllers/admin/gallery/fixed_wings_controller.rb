class Admin::Gallery::FixedWingsController < Admin::BaseController
  include GalleryAble

  def chinese_category
    '固定翼'
  end

  def english_category
    'fixed_wing'
  end

end
