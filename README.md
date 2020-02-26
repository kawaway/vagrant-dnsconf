# Vagrant::DnsConf

set vagrant guest dns configuration, e.g. interfaces

## Installation

```sh
git clone https://github.com/kawaway/vagrant-dnsconf
cd vagrant-dnsconf
bundle install
rake build
vagrant plugin install pkg/vagrant-dnsconf-*.gem
```

## Usage
Add following lines in Vagrantfile
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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kawaway/vagrant-dnsconf. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

