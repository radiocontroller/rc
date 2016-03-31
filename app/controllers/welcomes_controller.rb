class WelcomesController < BaseController
  layout 'welcome'

  def index
    @fighter_planes = Article.all
  end
end
