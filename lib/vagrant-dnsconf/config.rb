require "vagrant"

module VagrantPlugins
  module DnsConf
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :replaces, :deletes, :dnssec

      def initialize
        @replaces = UNSET_VALUE
        @deletes  = UNSET_VALUE
        @dnssec   = true
      end

      def is_set?
        @replaces != UNSET_VALUE or @deletes != UNSET_VALUE
      end
    end
  end
end
