module Admin
  class ArticlesController < BaseController
    layout 'admin'

    def new
    end

    def create
      Article.create(title: params[:title], content: params[:content])
      redirect_to new_admin_article_path
    end

  end
end
