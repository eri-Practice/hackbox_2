require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Amazon S3用の設定
      provider: 'AWS',
      region: 'ap-northeast-1',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    }
    config.fog_directory     =  'hackbox'
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/hackbox'
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end