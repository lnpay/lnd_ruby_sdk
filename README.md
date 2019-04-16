# LND SDK for Lightning Network (BTC) nodes

This is a SDK for ruby applications that can help you communicate with your Lightning Network node. There is still a lot to do before this gem can be used by others, but I will try to update it and create a stable version as soon as possible. If you would like to help, check out the Contributing section below.

## Requirements

This SDK requires that you're running a Lightning Node on the same host as the script is running. It also requires that you are using the default paths for your macaroon file `~/.lnd/data/chain/bitcoin/mainnet/admin.macaroon'` and certificate `~/.lnd/tls.cert`. Custom paths & configurations will be added in a future version. 

This SDK *does not* work with other servers than LND. If you're using c-lightning, it wont work.

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lnpay/lnd_ruby_sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
