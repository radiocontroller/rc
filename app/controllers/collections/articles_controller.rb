class Collections::ArticlesController < ActionController::Base
  layout 'user'

  def index
    @articles = current_user.article_ids.map { |id| Article.find(id) }
  end
end
