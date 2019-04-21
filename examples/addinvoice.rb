require 'lnd_ruby_sdk'

Lightning.configure do |config|
  config.grcp_host = '127.0.0.1'
  config.grcp_port = '10009'
  config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  config.certificate_path = '~/.lnd/tls.cert'
end

# Create a 123 satoshis invoice
response = Lightning.addinvoice(value: 123)

# Get payment request from response
payment_request = response.payment_request

puts "Please pay to: #{payment_request}"
