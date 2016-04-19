module VagrantWorkspace
  module Action
    class Pull
      attr_reader :app, :env, :machine, :workspace

      def initialize(app, env)
        @app = app
        @env = env
        @machine = env[:machine]
        @workspace = env[:workspace]
      end

      def call(env)
        projects.each do |project|
          machine.communicate.execute git_pull(project)
        end
        app.call(env)
      end

      def git_pull(project)
        "cd #{workspace_path}/#{project} && git pull origin master"
      end

      def workspace_path
        machine.config.workspace.absolute_path
      end

      def projects
        @_projects ||= YAML.load_file("workspaces/#{workspace}.yml").map do |project, info|
          project
        end
      end
    end
  end
end
