module Admin
  class ArticlesController < BaseController
    layout 'admin'
    before_action :set_article, only: [:edit, :update]

    def index
      @articles = Article.normal
    end

    def new
    end

    def edit
    end

    def update
      @article.update(article_params)
      redirect_to admin_articles_path
    end

    def create
      Article.create(title: params[:title], content: params[:content])
      redirect_to new_admin_article_path
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
