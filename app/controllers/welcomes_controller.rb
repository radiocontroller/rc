class WelcomesController < BaseController
  layout 'welcome'

  def index
    @article = Article.homepage.first
  end
end
