CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIN42BSODVCZKP57A',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'portfolio.joslynrosbrook'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end