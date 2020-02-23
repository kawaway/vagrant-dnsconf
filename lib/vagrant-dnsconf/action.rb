require "vagrant"
require 'log4r'

module VagrantPlugins
  module DnsConf
    class Action
      class ConfigureDNS
	def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @config = @machine.config.dnsconf
	  @ui = env[:ui]
	end

	def call(env)
          @app.call(env) unless @config.is_set?
	  
          replaces = @config.replaces
          deletes  = @config.deletes

          @ui.info "set dns-server #{replaces}, #{deletes}"
	  @machine.guest.capability(:set_conf, replaces, deletes)

          @app.call(env)
	end
      end
    end
  end
end
