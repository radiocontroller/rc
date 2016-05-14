class Admin::Gallery::FixedWingsController < Admin::BaseController
  include GalleryAble

  def english_category
    'fixed_wing'
  end

end
