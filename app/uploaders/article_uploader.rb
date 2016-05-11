class ArticleUploader < BaseUploader
  version :normal do
    process :resize_to_fit => [900, nil]
  end
end
