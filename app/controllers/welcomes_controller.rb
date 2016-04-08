class WelcomesController < BaseController
  layout 'welcome'

  def index
    @article = Article.homepage.first
    @banners = BannerPicture.where.not(sort_id: nil)
  end
end
