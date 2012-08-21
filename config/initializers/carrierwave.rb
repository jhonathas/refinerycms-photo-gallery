if (Rails.env.test? || Rails.env.development?)
  CarrierWave.configure do |config|
    config.root = Rails.root.to_s + Refinery::PhotoGallery.photo_gallery_dir_relative_to_root
    #Prefix in Uploader#url See https://github.com/jnicklas/carrierwave/pull/445
    config.base_path = Refinery::PhotoGallery.photo_gallery_dir
  end
else
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp') 
    config.cache_dir = 'carrierwave' 

    config.s3_access_key_id     = ENV['S3_KEY']
    config.s3_secret_access_key = ENV['S3_SECRET']
    config.s3_bucket            = ENV['S3_BUCKET']
    config.s3_access_policy     = "public_read"
  end
end
