module GalleryAble

  def self.included(base)
    base.module_eval do
      before_action :set_limit, only: [:index, :new, :create]
      before_action :set_category, only: [:index, :new]
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
      redirect_to "/admin/gallery/#{english_category.pluralize}", notice: '上传成功!'
    else
      render :new
    end
  end

  def update
    @picture = pictures.find(params[:id])
    if @picture.update(sort_id: params[:sort_id])
      empty_order!
      redirect_to "/admin/gallery/#{english_category.pluralize}", notice: '排序成功!'
    else
      redirect_to "/admin/gallery/#{english_category.pluralize}", alert: '排序失败!'
    end
  end

  private

    def set_limit
      @limit = 8
    end

    def picture_params
      params.require(:gallery_picture).permit(:resource, :sort_id).merge(category: english_category)
    end

    def empty_order!
      pictures.where(sort_id: @picture.sort_id).where.not(id: @picture.id).each(&:empty_order!)
    end

    def pictures
      GalleryPicture.normal.send(english_category.to_sym)
    end

    def set_category
      @category = chinese_category
    end

    def page_num
      12
    end

    def set_page_nav
      @page_nav = PageNavCollection.to_nav(
        [
          { name: '后台管理', url: '/admin' },
          { name: "#{set_category}图片", url: "/admin/gallery/#{english_category.pluralize}" },
          { name: Settings.action[request[:action]], end: true }
        ]
      )
    end

end
