# Vagrant::DnsConf

a vagrant plugin that set guest dns configuration, e.g. interfaces

### objective
If use synced-folder with nfs, vagrant try to install nfs-common but Installation fails if resolv.conf contains an inaccessible dns server addresses.

confirmed on
 - generic/debian9, generic/debian10
 - generic/ubuntu1804

## Installation

```sh
vagrant plugin install vagrant-dnsconf
```

## Usage
### Example Vagrantfile
```ruby
Vagrant.configure("2") do |config|

  config.dnsconf.replaces = [
          {:before => "4.2.2.1", :after => "192.168.100.10"},
          {:before => "4.2.2.2", :after => "192.168.100.11"}
  ]
  config.dnsconf.deletes = [
        "208.67.220.220"
  ]
  config.dnsconf.dnssec = false # option
  # ... other stuff
end
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

