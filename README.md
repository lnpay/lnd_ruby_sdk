# LND SDK for Lightning Network (BTC) nodes

[![Build Status](https://travis-ci.org/lnpay/lnd_ruby_sdk.svg?branch=master)](https://travis-ci.org/lnpay/lnd_ruby_sdk) [![Code Climate](https://codeclimate.com/github/lnpay/lnd_ruby_sdk.svg)](https://codeclimate.com/github/lnpay/lnd_ruby_sdk)

This is a SDK for ruby applications that can help you communicate with your Lightning Network node. There is still a lot to do before this gem can be used by others, but I will try to update it and create a stable version as soon as possible. If you would like to help, check out the Contributing section below.

## Requirements

This SDK requires that you're running a Lightning Node on the same host as the script is running. It also requires that you are using the default paths for your macaroon file `~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon` and certificate `~/.lnd/tls.cert`. Custom paths & configurations will be added in a future version. 

This SDK **does not** work with other servers than [LND](https://github.com/lightningnetwork/lnd). If your node is running on [c-lightning](https://github.com/ElementsProject/lightning), it wont work.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lnd_ruby_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lnd_ruby_sdk

## Usage

TODO: Write usage instructions here

## Documentation
SDK documentation can be found at [https://lnpay.github.io/lnd_ruby_sdk](https://lnpay.github.io/lnd_ruby_sdk)

## Examples

### Get node information
Returns general information concerning the lightning node including it's identity pubkey, alias, the chains it is connected to, and information concerning the number of open+pending channels.
```ruby
Lightning::Node.info 
=> {:identity_pubkey=>"031e...9f14", :alias=>"node-alias", :num_pending_channels=>0, :num_active_channels=>0, :num_peers=>3, :block_height=>571960, :block_hash=>"00000...e2b7101", :synced_to_chain=>true, :testnet=>false, :uris=>[], :best_header_timestamp=>1555464518, :version=>"0.6.0-beta commit=v0.6-beta-rc..44ad", :num_inactive_channels=>0, :chains=>[{:chain=>"bitcoin", :network=>"mainnet"}]}
```

### Create an invoice (and payment request)
Attempts to add a new invoice to the invoice database and returns a payment request.
```ruby
Lightning::Invoice.create(amount: 500, desc: '1x Cappuccino') 
=> {:r_hash=>"\x88...1E<U", :payment_request=>"lnbc...mcpampmwe", :add_index=>31}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

A good way to start would be by running `rake spec` to check out the list of `Pending` tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lnpay/lnd_ruby_sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
