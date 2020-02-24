require "vagrant"

module VagrantPlugins
  module DnsConf
    module Cap
      module Debian
        module SetDnsConf

	  def self.set_dnsconf(m, opts)
            _set_conf(m, opts[:replaces], opts[:deletes], "/etc/resolv.conf")
            _set_conf(m, opts[:replaces], opts[:deletes], "/etc/networks/interfaces")
	  end

	  private
	  def self._set_conf(m, replaces, deletes, file)
	    deletes.each do |delete|
              @m.communicate.sudo("sed -e -i \"/#{delete}/d\" #{file}")
	    end
	    replaces.each do |replace|
              @m.communicate.sudo("sed -e -i \"s/#{replace[:before]}/#{replace[:after]}/\" #{file}")
            end
          end
	  # 4.2.2.1
	  # 4.2.2.2
	  # 208.67.220.220
        end
      end
    end
  end
end
