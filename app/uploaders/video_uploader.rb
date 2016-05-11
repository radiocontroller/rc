class VideoUploader < BaseUploader
  version :normal do
    process :resize_to_fill => [282, 185]
  end
end
