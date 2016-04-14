module Upload
  class ImagesController < ActionController::Base
    def create
      image = GalleryPicture.create(resource: params[:wangEditorH5File])
      render json: image.resource.url
    end
  end
end
