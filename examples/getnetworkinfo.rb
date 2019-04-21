require 'lnd_ruby_sdk'

# Default config
Lightning.configure do |config|
  config.grcp_host = '127.0.0.1'
  config.grcp_port = '10009'
  config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  config.certificate_path = '~/.lnd/tls.cert'
end

# Send request to get Bitrefill's nodeinfo
response = Lightning.getnetworkinfo

puts "Total channels: #{response.num_channels}"
puts "Total network capacity: #{response.total_network_capacity} satoshis"
puts "Avg channel size: #{response.avg_channel_size}"
