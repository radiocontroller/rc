class Collections::ArticlesController < Collections::BaseController
  before_action :set_user

  def index
    @articles = @user.article_ids.map { |id| Article.find(id) }
  end
end
