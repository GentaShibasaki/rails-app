# CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider:              'AWS',
#     aws_access_key_id:     ENV['S3_ACCESS_KEY'],
#     aws_secret_access_key: ENV['S3_SECRET_KEY'],
#     region:                ENV['S3_REGION'],
#   }

#   config.fog_public     = true
#   config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  # config.cache_storage = :fog


  # config.fog_directory = ''
  # config.asset_host = 'https://  .s3user.s3.ap-northeast-1.amazonaws.com'


# end

# CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/