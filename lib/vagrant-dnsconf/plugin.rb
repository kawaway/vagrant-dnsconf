require "vagrant"

module VagrantPlugins
  module DnsConf
    class Plugin < Vagrant.plugin('2')

      name 'vagrant-dnsconf'

      description <<-DESC
        set dns configuration in guest such as interfaces.
      DESC

      config 'dnsconf' do
        require_relative 'config'
        Config
      end

      action_hook 'set_dnsconf' do |hook|
        require_relative 'action'

        # the standard provision action
        hook.after Vagrant::Action::Builtin::WaitForCommunicator, Action::ConfigureDNS
      end

      guest_capability('debian', 'set_dnsconf') do
        require_relative 'cap/debian/set_dnsconf.rb'
        Cap::Debian::SetDnsConf
      end

      guest_capability('ubuntu', 'set_dnsconf') do
        require_relative 'cap/ubuntu/set_dnsconf.rb'
        Cap::Ubuntu::SetDnsConf
      end
    end
  end
end
