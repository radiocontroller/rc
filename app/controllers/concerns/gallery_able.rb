module GalleryAble

  def self.included(base)
    base.module_eval do
      before_action :set_page_nav
      before_action :set_limit, :set_category, only: [:index, :new]
    end
  end

  def index
    @pictures = pictures.order('sort_id asc').page(params[:page] || 1).per_page(page_num)
  end

  def new
    @picture = GalleryPicture.new
    @url = request.path.split('/new').first
  end

  def create
    picture = GalleryPicture.new(picture_params)
    if picture.save
      redirect_to "/admin/gallery/#{english_category.pluralize}", notice: '上传成功!'
    else
      redirect_to "/admin/gallery/#{english_category.pluralize}/new", alert: picture.errors.full_messages
    end
  end

  def update
    pictures.find_by(sort_params).try(:empty_order!)
    pictures.find(params[:id]).update(sort_params)
    redirect_to "/admin/gallery/#{english_category.pluralize}", notice: '更新成功!'
  end

  private

    def set_limit
      @limit = 8
    end

    def picture_params
      params.require(:gallery_picture).permit(:resource).merge(category: english_category)
    end

    def sort_params
      { sort_id: params[:sort_id] }
    end

    def pictures
      GalleryPicture.send(english_category.to_sym)
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
          { name: "#{set_category}模块", url: "/admin/gallery/#{english_category.pluralize}" },
          { name: name, url: request.path, end: true }
        ]
      )
    end

end
