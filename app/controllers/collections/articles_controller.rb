class Collections::ArticlesController < Collections::BaseController
  before_action :set_user

  def index
    @articles = @user.article_ids.map { |id| Article.normal.find(id) }
  end
end
