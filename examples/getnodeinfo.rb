require 'lnd_ruby_sdk'

# Default config
Lightning.configure do |config|
  config.grcp_host = '127.0.0.1'
  config.grcp_port = '10009'
  config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  config.certificate_path = '~/.lnd/tls.cert'
end

# Send request to get Bitrefill's nodeinfo
response = Lightning.getnodeinfo("030c3f19d742ca294a55c00376b3b355c3c90d61c6b6b39554dbc7ac19b141c14f")

puts "Node num channels. #{response.num_channels}"
puts "Node address. #{response.node.addresses[0].addr}"
puts "Node alias. #{response.node.alias}"
puts "Total capacity. #{response.total_capacity} satoshis"
