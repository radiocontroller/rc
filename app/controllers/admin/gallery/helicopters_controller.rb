class Admin::Gallery::HelicoptersController < Admin::BaseController
  include GalleryAble

  def english_category
    'helicopter'
  end

end
