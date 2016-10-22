require 'carrierwave/processing/mini_magick'
class BaseUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "images/#{model.class.to_s.underscore.pluralize}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
