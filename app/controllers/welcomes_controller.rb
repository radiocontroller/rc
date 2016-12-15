class WelcomesController < ApplicationController
  layout 'welcome'
  after_action :add_access_log, only: [:index]

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

  private

  def add_access_log
      AccessLogJob.perform_later(request.ip) if "127.0.0.1" != request.ip
  end

end
