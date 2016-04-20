module Admin
  class ArticlesController < BaseController
    layout 'admin'
    before_action :set_article, only: [:edit, :update]

    def index
      @articles = Article.normal.order('id desc')
    end

    def new
      @article = Article.normal.new
    end

    def edit
    end

    def update
      @article.update(article_params)
      redirect_to admin_articles_path, notice: '更新成功!'
    end

    def create
      article = Article.new(article_params)
      if article.save
        redirect_to admin_articles_path, notice: '创建成功!'
      else
        redirect_to new_admin_article_path, alert: article.errors.full_messages
      end
    end

    private

      def set_article
        @article = Article.normal.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :content)
      end

  end
end
