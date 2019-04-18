# Namespace for classes and modules that handle communication with your LND node
module Lightning
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # The configure class method stores a Configuration object inside
  # the Lightning module. Anything set from the configure block is
  # an attr_accessor on the Configuration class.
  #
  # @example Configure your application
  #  Lightning.configure do |config|
  #    config.grcp_host = '127.0.0.1'
  #    config.grcp_port = '10009'
  #    config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  #    config.certificate_path = '~/.lnd/tls.cert'
  #  end
  class Configuration
    attr_accessor :grcp_host
    attr_accessor :grcp_port
    attr_accessor :macaroon_path
    attr_accessor :certificate_path
  end
end
