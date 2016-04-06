require 'vagrant_workspace/action/checkout'

module VagrantWorkspace
  module Action
    include Vagrant::Action::Builtin

    def self.checkout
      Vagrant::Action::Builder.new.tap do |builder|
        builder.use Checkout
      end
    end
  end
end
