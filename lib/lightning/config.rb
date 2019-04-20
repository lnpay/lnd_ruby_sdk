# Namespace for classes and modules that handle communication with your LND node
module Lightning
  class << self
    attr_accessor :configuration
  end

  # The configure class method stores a Configuration object inside
  # the Lightning module. Anything set from the configure block is
  # an attr_accessor on the Configuration class.
  # @example Configure your application
  #  Lightning.configure do |config|
  #    config.grcp_host = '127.0.0.1'
  #    config.grcp_port = '10009'
  #    config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  #    config.certificate_path = '~/.lnd/tls.cert'
  #  end
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # The configuration class holding all configuration variables.
  class Configuration
    # Host/IP to your nodes server (default: 127.0.0.1)
    attr_accessor :grcp_host

    # gRCP port used by LND (default: 10009)
    attr_accessor :grcp_port

    # Full path to your macaroon file
    # (default: ~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon)
    attr_accessor :macaroon_path

    # Full path to your certificate file (default: ~/.lnd/tls.cert)
    attr_accessor :certificate_path
  end
end
