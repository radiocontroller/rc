class ArticlesController < BaseController
  def index
    q = Article.normal.ransack(params[:q])
    @articles = q.result.order('id desc')
    set_search_value
  end

  def show
    @article = Article.normal.find(params[:id])
  end

  private

    def set_search_value
      @title = (params[:q] || {})[:title_cont]
    end
end
