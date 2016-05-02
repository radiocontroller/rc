class WelcomesController < ApplicationController
  layout 'welcome'

  def index
    @battle_planes = BattlePlane.sorted
    @video = Video.normal.homepage
    @banners = BannerPicture.sorted
    @fixed_wings = GalleryPicture.fixed_wing.sorted
    @gliders = GalleryPicture.glider.sorted
    @fpvs = GalleryPicture.fpv.sorted
    @helicopters = GalleryPicture.helicopter.sorted
  end
end
