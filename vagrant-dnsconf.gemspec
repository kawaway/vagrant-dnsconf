# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-dnsconf/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-dnsconf"
  spec.version       = VagrantPlugins::DnsConf::VERSION
  spec.authors       = ["kawawa"]
  spec.email         = ["kawawa.y@gmail.com"]

  spec.summary       = %q{a vagrant plugin that set guest dns configuration, e.g. interfaces}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/kawaway/vagrant-dnsconf"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.10"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec"
end
