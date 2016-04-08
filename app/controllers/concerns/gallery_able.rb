module GalleryAble

  def self.included(base)
    base.module_eval do
      before_action :set_limit, only: [:index]
    end
  end

  def index
    @pictures = pictures.order('sort_id asc')
    set_category
  end

  def new
    @picture = GalleryPicture.new
    set_category
  end

  def create
    picture = GalleryPicture.new(picture_params)
    picture.category = english_category
    if picture.save
      redirect_to send("admin_gallery_#{english_category.pluralize}_path")
    else
      @picture = GalleryPicture.new
      render :new
    end
  end

  def update
    previous = pictures.find_by(sort_id: params[:sort_id])
    previous.update(sort_id: nil) if previous.present?
    current = pictures.find(params[:id])
    current.update(sort_id: params[:sort_id])
    redirect_to send("admin_gallery_#{english_category.pluralize}_path")
  end

  private

    def set_limit
      @limit = 8
    end

    def picture_params
      params.require(:gallery_picture).permit(:resource)
    end

    def pictures
      GalleryPicture.send(english_category.to_sym)
    end

    def set_category
      @category = chinese_category
    end

end
