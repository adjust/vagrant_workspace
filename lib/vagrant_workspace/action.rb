require 'vagrant_workspace/action/checkout'
require 'vagrant_workspace/action/pull'

module VagrantWorkspace
  module Action
    include Vagrant::Action::Builtin

    def self.checkout
      Vagrant::Action::Builder.new.tap do |builder|
        builder.use Checkout
      end
    end

    def self.pull
      Vagrant::Action::Builder.new.tap do |builder|
        builder.use Pull
      end
    end
  end
end
