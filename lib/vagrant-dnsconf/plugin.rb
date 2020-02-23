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

      action_hook 'dns_configure' do |hook|
        require_relative 'action'

        # the standard provision action
        hook.after Vagrant::Action::Builtin::Provision, Action::ConfigureDNS

	# before shared_folder
	#hook.before(VagrantPlugins::SyncedFolderNFS, Action::ConfigureDNS)
	#hook.before(VagrantPlugins::SyncedFolderSMB, Action::ConfigureDNS)
      end

      guest_capability('debian', 'set_conf') do
        require_relative 'cap/debian/set_conf.rb'
        Cap::Debian::SetConf
      end
    end
  end
end
