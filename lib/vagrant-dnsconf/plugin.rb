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

      action_hook 'dnsconf_configure' do |hook|
        require_relative 'action'
	# before shared_folder
	hook.before(VagrantPlugins::SyncedFolderNFS, Action::DnsConf)
	hook.before(VagrantPlugins::SyncedFolderSMB, Action::DnsConf)
      end

      guest_capability('debian', 'set_conf') do
        require_relative 'cap/debian/dns_action.rb'
        Cap::Debian::DnsSetConf
      end
    end
  end
end
