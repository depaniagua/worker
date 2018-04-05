class ImageUploader < CarrierWave::Uploader::Base

   #storage :file
   storage :fog

  #include CarrierWave::MimeTypes
  #process :set_content_type

  def store_dir
    "image/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
