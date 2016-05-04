class Collections::VideosController < Collections::BaseController
  before_action :set_page_nav

  def index
    @videos = @user.video_ids.map { |id| Video.normal.find(id) }
  end

  private

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '首页', url: '/' },
          { name: @user.username, url: "/users/#{@user.id}" },
          { name: '收藏视频', end: true }
        ]
      )
    end

end
