class Admin::Gallery::HelicoptersController < Admin::BaseController
  include GalleryAble

  def chinese_category
    '直升机'
  end

  def english_category
    'helicopter'
  end

end
