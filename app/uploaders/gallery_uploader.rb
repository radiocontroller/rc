class GalleryUploader < BaseUploader
  version :large do
    process resize_to_fit: [780, nil]
  end

  version :normal do
    process resize_to_fill: [270, 270]
  end

  version :small do
    process resize_to_fill: [270, 200]
  end
end
