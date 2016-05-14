class WelcomesController < ApplicationController
  layout 'welcome'

  def index
    @battle_planes = BattlePlane.normal.sorted
    @video = Video.normal.homepage
    @banners = BannerPicture.normal.sorted
    set_gallery_pictures
  end

  def set_gallery_pictures
    galler_pictures = GalleryPicture.normal.sorted
    @fixed_wings = galler_pictures.fixed_wing
    @gliders = galler_pictures.glider
    @fpvs = galler_pictures.fpv
    @helicopters = galler_pictures.helicopter
  end
end
