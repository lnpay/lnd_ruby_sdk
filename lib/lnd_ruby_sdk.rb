require 'grpc'
require 'rpc_services_pb'
require 'macaroon_interceptor.rb'
require 'json'
require 'ostruct'

require 'lightning/version'
require 'lightning/stub'
require 'lightning/node'
require 'lightning/invoices'

# Namespace for classes and modules that handle communication with your LND node
module Lightning
  class << self
    attr_accessor :config
  end

  # Basic configuration variables that can be changed from
  # outside the module.
  self.config = {
    macaroon_path: '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon',
    certificate_path: '~/.lnd/tls.cert'
  } 
end
