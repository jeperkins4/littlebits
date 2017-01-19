CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => '1JTKGY56ASQZ8SRGCHG2',
    :aws_secret_access_key => 'X4BQEiFZv6wPm/J7+8fwU6LS81y33HyvqsYGm+iU'
  }
  #config.aws_bucket = 'placeify'
  config.fog_directory = 'redhills-littlebits'
  #config.cache_dir = "#{Rails.root}/tmp/uploads"
  #config.asset_host = "http://#{ENV['S3_CDN']}"
  config.fog_public = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.delete_tmp_file_after_storage = false
end

