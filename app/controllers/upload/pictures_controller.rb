module Upload
  class PicturesController < ActionController::Base
    def create
      picture = ArticlePicture.create(resource: params[:wangEditorH5File])
      render text: picture.resource.url
    end
  end
end