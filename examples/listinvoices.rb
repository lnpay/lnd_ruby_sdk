require 'lnd_ruby_sdk'

# Send request to LND
response = Lightning.listinvoices(num_max_invoices: 3, reverse: true)

# Get invoices from response
invoices = response.invoices

# Loop through all invoices
invoices.each do |invoice|
  inv_desc = invoice.memo
  inv_amt = invoice.value
  inv_amt_paid = invoice.amt_paid
  settled = invoice.settled

  puts "#{inv_desc}: #{inv_amt_paid} paid of #{inv_amt} satoshis - Settled: #{settled}"
end
