require 'lnd_ruby_sdk'

# Send request to LND
response = Lightning.getinfo

# Get the node alias from response
node_alias = response.alias

# Get the node's pubkey from response
node_pubkey = response.identity_pubkey

# Print them
puts "Node alias: #{node_alias}"
puts "Pub key: #{node_pubkey}"
