class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :set_page_nav

  def index
    q = Article.normal.ransack(params[:q])
    @articles = q.result.order('id desc')
    set_search_value
  end

  def show
  end

  private

    def set_search_value
      @title = params[:q] && params[:q][:title_cont]
    end

    def set_article
      @article = Article.normal.find(params[:id])
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '首页', url: '/' },
          { name: '文章', url: '/articles' },
          { name: @article.try(:title) || Settings.action[request[:action]], end: true }
        ]
      )
    end
end
