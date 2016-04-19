require_relative 'action'

module VagrantWorkspace
  class Command < Vagrant.plugin(2, :command)
    # Show description when `vagrant list-commands` is triggered
    def self.synopsis
      'plugin: vagrant_workspace: manages workspace files'
    end

    def execute
      _, _command, workspace = ARGV

      with_target_vms do |machine|
        @env.action_runner.run(Action.checkout, {
          global_env: @env,
          machine: machine,
          workspace: workspace
        })
      end
    end
  end
end
