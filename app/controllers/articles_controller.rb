class ArticlesController < BaseController
  def index
    @articles = Article.normal
  end

  def show
    @article = Article.normal.find(params[:id])
  end
end
