class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: [:edit, :update]
  before_action :set_categories, except: [:index]

  def index
    q = Video.normal.ransack(params[:q])
    @videos = q.result.order(created_at: :desc)
    set_search_values
    @categories = Video::ID_CATEGORIES.invert.to_a
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admin_videos_path, notice: '创建成功!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to admin_videos_path, notice: '更新成功!'
    else
      render :edit
    end
  end

  private

    def set_search_values
      params[:q] ||= {}
      @search = {
        category: params[:q][:category_eq],
        title: params[:q][:title_cont],
        homepage: params[:q][:is_homepage_true]
      }
    end

    def video_params
      params.require(:video).permit(:title, :url, :image, :category)
    end

    def set_video
      @video = Video.normal.find(params[:id])
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: '视频模块', url: '/admin/videos' },
          { name: Settings.action[request[:action]], end: true }
        ]
      )
    end

    def set_categories
      @categories = Video::CATEGORIES.invert.to_a
    end

end
