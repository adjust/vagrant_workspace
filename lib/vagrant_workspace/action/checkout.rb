module VagrantWorkspace
  module Action
    class Checkout
      attr_reader :app, :env, :machine, :workspace

      def initialize(app, env)
        @app = app
        @env = env
        @machine = env[:machine]
        @workspace = env[:workspace]
      end

      def call(env)
        machine.communicate.execute(big_git_command)
        app.call(env)
      end

      def big_git_command
        YAML.load_file("workspaces/#{workspace}.yml").map do |project, info|
          "git --git-dir=#{workspace_path}/#{project}/.git --work-tree=#{workspace_path}/#{project} checkout #{info['checkout']}"
        end.join(' && ')
      end

      def workspace_path
        machine.config.workspace.absolute_path
      end
    end
  end
end
