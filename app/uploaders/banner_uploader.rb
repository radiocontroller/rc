class BannerUploader < BaseUploader

  version :big do
    process :resize_to_fit => [1920, nil]
  end

  version :large do
    process :resize_to_fit => [880, 590]
  end

  version :normal do
    process :resize_to_fill => [270, 200]
  end

  version :small do
    process :resize_to_fill => [105, 105]
  end

end
