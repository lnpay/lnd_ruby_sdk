require 'lnd_ruby_sdk'

Lightning.configure do |config|
  config.grcp_host = '127.0.0.1'
  config.grcp_port = '10009'
  config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  config.certificate_path = '~/.lnd/tls.cert'
end

# Send request to LND
response = Lightning.getinfo

# Get the node alias from response
node_alias = response.alias

# Get the node's pubkey from response
node_pubkey = response.identity_pubkey

# Print them
puts "Node alias: #{node_alias}"
puts "Pub key: #{node_pubkey}"
