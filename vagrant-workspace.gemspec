# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant/workspace/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-workspace"
  spec.version       = Vagrant::Workspace::VERSION
  spec.authors       = ["Ali Ismayilov"]
  spec.email         = ["ali@ismailov.info"]

  spec.summary       = %q{Vagrant workspaces plugin}
  spec.description   = %q{Vagrant workspaces plugin}
  spec.homepage      = "https://github.com/adjust/vagrant-workspace"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
