require 'lnd_ruby_sdk'

Lightning.configure do |config|
  config.grcp_host = '127.0.0.1'
  config.grcp_port = '10009'
  config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  config.certificate_path = '~/.lnd/tls.cert'
end

# Subscribe for new invoice changes (add/settle)
Lightning.subscribeinvoices do |invoice|
  puts invoice.inspect
end

# Subscribe for new invoice changes since a specific settle index.
# This allows callers to catch up on any events they
# missed while they weren't connected to the streaming RPC.
Lightning.subscribeinvoices(settle_index: 13) do |invoice|
  puts invoice.inspect
end
