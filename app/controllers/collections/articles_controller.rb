class Collections::ArticlesController < ActionController::Base
  layout 'application'

  def index
    @articles = current_user.article_ids.map { |id| Article.find(id) }
  end
end
