unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA35AU326GDNHOFG7A',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory = 'rails-image-1234'
    config.cache_storage = :fog
  end
end
