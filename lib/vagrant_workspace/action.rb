require 'vagrant_workspace/action/run'

module VagrantWorkspace
  module Action
    include Vagrant::Action::Builtin

    def self.run
      Vagrant::Action::Builder.new.tap do |builder|
        builder.use Run
      end
    end
  end
end
