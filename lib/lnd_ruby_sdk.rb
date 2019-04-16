require 'grpc'
require 'rpc_services_pb'
require 'macaroon_interceptor.rb'

require 'lightning/version'
require 'lightning/node'
require 'lightning/invoice'

# LND SDK for lightning network
module Lightning
  class << self
    def macaroon
      macaroon_binary = File.read(
        File.expand_path('~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon')
      )

      macaroon_binary.each_byte.map { |b| b.to_s(16).rjust(2, '0') }.join
    end

    def credentials
      ENV['GRPC_SSL_CIPHER_SUITES'] =
        ENV['GRPC_SSL_CIPHER_SUITES'] || 'HIGH+ECDSA'

      certificate = File.read(File.expand_path('~/.lnd/tls.cert'))
      GRPC::Core::ChannelCredentials.new(certificate)
    end

    def stub
      Lnrpc::Lightning::Stub.new(
        '127.0.0.1:10009',
        credentials,
        interceptors: [MacaroonInterceptor.new(macaroon)]
      )
    end
  end
end
