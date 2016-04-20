module Ajax
  class ArticlesController < BaseController
    def destroy
      @article = Article.normal.find(params[:id])
      @article.remove!
    end
  end
end
