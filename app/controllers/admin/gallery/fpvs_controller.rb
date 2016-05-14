class Admin::Gallery::FpvsController < Admin::BaseController
  include GalleryAble

  def english_category
    'fpv'
  end

end
