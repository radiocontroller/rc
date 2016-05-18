class Admin::ArticlesController < Admin::BaseController
  before_action :set_search, only: [:index]
  before_action :set_article, only: [:edit, :update]

  def index
    q = Article.normal.ransack(params[:q])
    @articles = q.result.order('id desc').page(params[:page] || 1).per_page(page_num)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: '更新成功!'
    else
      render :edit
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_path, notice: '创建成功!'
    else
      render :new
    end
  end

  private

    def set_search
      @title = {}
      @title = params[:q] && params[:q][:title_cont]
    end

    def set_article
      @article = Article.normal.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end

    def page_num
      10
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: '文章模块', url: '/admin/articles' },
          { name: Settings.action[action_name], end: true }
        ]
      )
    end

end
