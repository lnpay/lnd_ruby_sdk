# LND SDK for Lightning Network (BTC) nodes

[![Build Status](https://travis-ci.org/lnpay/lnd_ruby_sdk.svg?branch=master)](https://travis-ci.org/lnpay/lnd_ruby_sdk) [![Code Climate](https://codeclimate.com/github/lnpay/lnd_ruby_sdk.svg)](https://codeclimate.com/github/lnpay/lnd_ruby_sdk)

This is a SDK for ruby applications that can help you communicate with your Lightning Network node. There is still a lot to do before this gem can be used by others, but I will try to update it and create a stable version as soon as possible. If you would like to help, check out the Contributing section below.

## Requirements

This SDK requires that you're running a Lightning Node on the same host as the script is running. It also requires that you are using the default paths for your macaroon file `~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon` and certificate `~/.lnd/tls.cert`. Custom paths & configurations will be added in a future version. 

This SDK **does not** work with other servers than [LND](https://github.com/lightningnetwork/lnd). If your node is running on [c-lightning](https://github.com/ElementsProject/lightning), it wont work.

## Installation

Add this line to your application's Gemfile:

```
gem 'lnd_ruby_sdk'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install lnd_ruby_sdk
```

## Usage

TODO: Write usage instructions here

## Documentation
SDK documentation and all available commands can be found at [https://lnpay.github.io/lnd_ruby_sdk/Lightning.html](https://lnpay.github.io/lnd_ruby_sdk/Lightning.html)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

A good way to start would be by running `rake spec` to check out the list of `Pending` tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lnpay/lnd_ruby_sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
