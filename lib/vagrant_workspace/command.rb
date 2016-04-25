require 'vagrant_workspace/action'

module VagrantWorkspace
  class Command < Vagrant.plugin(2, :command)
    # Show description when `vagrant list-commands` is triggered
    def self.synopsis
      'plugin: vagrant_workspace: executes workspace files'
    end

    def execute
      _, workspace_file = ARGV

      with_target_vms do |machine|
        @env.action_runner.run(Action.run, {
          global_env: @env,
          machine: machine,
          workspace_file: workspace_file
        })
      end
    end
  end
end
