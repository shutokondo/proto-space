CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws.access_key_id,
    aws_secret_access_key: Settings.aws.secret_access_key,
    region: Settings.aws.s3_bucket_region,
  }

  # config.storage = :fog
  config.fog_directory = Settings.aws.s3_bucket_name
  # config.fog_public = true

end