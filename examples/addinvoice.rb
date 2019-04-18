require 'lnd_ruby_sdk'

# Send request to LND
response = Lightning.addinvoice(amt: 123)

# Get payment request from response 
payment_request = response.payment_request

puts "Please pay to: #{payment_request}"