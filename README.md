# Vagrant::DnsConf

set vagrant guest dns configuration, e.g. resolv.conf

## Installation

```sh
git clone https://github.com/kawaway/vagrant-dnsconf
cd vagrant-dnsconf
bundle install
rake build
vagrant plugin install pkg/vagrant-dnsconf-*.gem
```


## Usage

```ruby
  config.dnsconf.replaces = [
          {:before => "4.2.2.1", :after => "192.168.100.10"},
          {:before => "4.2.2.2", :after => "192.168.100.11"}
  ]
  config.dnsconf.deletes = [
        "208.67.220.220"
  ]
```

## Development

```sh
git clone https://github.com/kawaway/vagrant-dnsconf
cd vagrant-dnsconf
bundle install
rake build
vagrant plugin install pkg/vagrant-dnsconf-*.gem
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kawaway/vagrant-dnsconf. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

