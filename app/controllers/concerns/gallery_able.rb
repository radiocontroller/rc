module GalleryAble

  def self.included(base)
    base.module_eval do
      before_action :set_chinese_category, :set_limit, :set_page_nav
    end
  end

  def index
    @pictures = pictures.order('sort_id asc').page(params[:page] || 1).per_page(page_num)
  end

  def new
    @picture = GalleryPicture.new
  end

  def create
    @picture = GalleryPicture.new(picture_params)
    if @picture.save
      redirect_to index_path, notice: '上传成功!'
    else
      render :new
    end
  end

  def update
    @picture = pictures.find(params[:id])
    if @picture.update(sort_id: params[:sort_id])
      redirect_to index_path, notice: '排序成功!'
    else
      redirect_to index_path, alert: '排序失败!'
    end
  end

  private

    def set_chinese_category
      @chinese_category = GalleryPicture::CATEGORIES[english_category]
    end

    def set_limit
      @limit = 8
    end

    def picture_params
      params.require(:gallery_picture).permit(:resource, :sort_id).merge(category: english_category)
    end

    def pictures
      GalleryPicture.normal.send(english_category.to_sym)
    end

    def page_num
      12
    end

    def index_path
      "/admin/gallery/#{english_category.pluralize}"
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: "#{@chinese_category}图片", url: index_path },
          { name: Settings.action[request[:action]], end: true }
        ]
      )
    end

end
