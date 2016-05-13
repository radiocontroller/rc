class Upload::PicturesController < ActionController::Base
  def create
    picture = ArticlePicture.create(resource: params[:wangEditorH5File])
    render text: picture.resource.normal.url
  end
end
