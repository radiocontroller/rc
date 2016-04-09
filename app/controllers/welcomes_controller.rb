class WelcomesController < BaseController
  layout 'welcome'

  def index
    @article = Article.homepage.first
    @banners = BannerPicture.sorted
    @fixed_wings = GalleryPicture.fixed_wing.sorted
    @gliders = GalleryPicture.glider.sorted
    @fpvs = GalleryPicture.fpv.sorted
    @helicopters = GalleryPicture.helicopter.sorted
  end
end
