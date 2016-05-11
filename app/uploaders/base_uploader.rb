require 'carrierwave/processing/mini_magick'
class BaseUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "images/#{model.class.to_s.underscore.pluralize}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
