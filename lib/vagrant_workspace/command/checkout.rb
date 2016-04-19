module VagrantWorkspace
  module Command
    class Checkout < Vagrant.plugin(2, :command)
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
end
