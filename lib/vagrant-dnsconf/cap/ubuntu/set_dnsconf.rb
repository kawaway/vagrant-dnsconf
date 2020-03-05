require "vagrant"

module VagrantPlugins
  module DnsConf
    module Cap
      module Ubuntu
        module SetDnsConf

	  def self.set_dnsconf(m, opts)
	    #sed -i -e "s/4.2.2.1 4.2.2.2 208.67.220.220/192.168.16.10 192.168.16.11/" /etc/systemd/resolved.conf -e "s/DNSSEC=yes/DNSSEC=no/"
            file = "/etc/systemd/resolved.conf"
	    opts[:deletes].each do |delete|
              m.communicate.sudo("sed -i -e \"s/#{delete}//\" #{file}")
	    end
	    opts[:replaces].each do |replace|
              m.communicate.sudo("sed -i -e \"s/#{replace[:before]}/#{replace[:after]}/\" #{file}")
	    end

            m.communicate.sudo("sed -i -e \"s/DNSSEC=yes/DNSSEC=no/\" #{file}") unless opts[:dnssec]
            m.communicate.sudo("systemctl restart systemd-resolved")
	  end
        end
      end
    end
  end
end
