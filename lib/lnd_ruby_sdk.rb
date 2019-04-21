require 'grpc'
require 'rpc_services_pb'
require 'macaroon_interceptor.rb'
require 'json'
require 'ostruct'

require 'lightning/config'
require 'lightning/version'
require 'lightning/stub'
require 'lightning/node'
require 'lightning/invoices'
require 'lightning/channels'

# Default config
Lightning.configure do |config|
  config.grcp_host = '127.0.0.1'
  config.grcp_port = '10009'
  config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  config.certificate_path = '~/.lnd/tls.cert'
end
