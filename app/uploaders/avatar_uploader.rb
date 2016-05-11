class AvatarUploader < BaseUploader

  def default_url
    "/images/avatar.png"
  end

  version :large do
    process resize_to_fill: [152, 152]
  end

  version :normal do
    process resize_to_fill: [108, 108]
  end

  version :small do
    process resize_to_fill: [90, 90]
  end

end
