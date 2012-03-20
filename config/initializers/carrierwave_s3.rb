CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider               => 'AWS',       # required
        :aws_access_key_id      => 'AKIAJRIZCC5KYE4O5V4Q',       # required
        :aws_secret_access_key  => '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',       # required
        #:region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
      }
      config.fog_directory  = 'media.tucolegionline.com'                     # required
      config.fog_public     = false
      config.cache_dir = "#{Rails.root}/tmp/uploads"
    end
