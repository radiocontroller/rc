class Collections::ArticlesController < Collections::BaseController
  before_action :set_page_nav

  def index
    @articles = @user.article_ids.map { |id| Article.normal.find(id) }
  end

  private

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '首页', url: '/' },
          { name: @user.username, url: "/users/#{@user.id}" },
          { name: '收藏文章', end: true }
        ]
      )
    end
end
