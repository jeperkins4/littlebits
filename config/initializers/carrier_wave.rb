CarrierWave.configure do |config|
  access_key_id = ENV['S3_KEY']
  secret_access_key = ENV['S3_PASSWORD']

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: access_key_id,
    aws_secret_access_key: secret_access_key
  }
  config.fog_directory = ENV['S3_BUCKET']
  config.fog_public = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.delete_tmp_file_after_storage = false
end

