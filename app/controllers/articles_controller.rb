class ArticlesController < BaseController
  def index
    @articles = Article.all.where(is_homepage: false)
  end

  def show
    @article = Article.find(params[:id])
  end
end
