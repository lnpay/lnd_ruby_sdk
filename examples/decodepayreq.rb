require 'lnd_ruby_sdk'

Lightning.configure do |config|
  config.grcp_host = '127.0.0.1'
  config.grcp_port = '10009'
  config.macaroon_path = '~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'
  config.certificate_path = '~/.lnd/tls.cert'
end

# Add a new invoice and get the payment request so we have something to test with
response = Lightning.addinvoice(amt: 1337, memo: 'It works!')
payment_request = response.payment_request

# Send request to LND
payreq = Lightning.decodepayreq(payment_request)

# Fetch the destination pubkey from response
destination_pub_key = payreq.destination

# Fetch amount in satoshis from response
amt_in_satoshis = payreq.num_satoshis

# Fetch amount in satoshis from response
desc = payreq.description

puts "Destination pubkey: #{destination_pub_key}"
puts "Amount in satoshis should be 1337: #{amt_in_satoshis}"
puts "Invoice description: #{desc}"