CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => ENV['S3_KEY'],
    :aws_secret_access_key => ENV['S3_PASSWORD']
  }
  #config.aws_bucket = 'placeify'
  config.fog_directory = ENV['S3_BUCKET']
  #config.cache_dir = "#{Rails.root}/tmp/uploads"
  #config.asset_host = "http://#{ENV['S3_CDN']}"
  config.fog_public = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.delete_tmp_file_after_storage = false
end

