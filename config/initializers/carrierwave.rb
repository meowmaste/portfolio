CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET'],                        # required
    :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'portfolio.joslynrosbrook'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end