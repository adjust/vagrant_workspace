module VagrantWorkspace
  module Action
    class Run
      attr_reader :app, :env, :machine, :workspace_file

      def initialize(app, env)
        @app = app
        @env = env
        @machine = env[:machine]
        @workspace_file = env[:workspace_file]
      end

      def call(env)
        projects.each do |project_name, project|
          puts "Executing commands on #{project_name}:"
          project['run'].each do |command|
            puts "$ #{command}"
            machine.communicate.execute "cd #{path(project_name)} && #{command}"
          end
        end
        app.call(env)
      end

      private

      def projects
        YAML.load_file(workspace_file)
      end

      def path(project)
        File.join(workspace_path, project)
      end

      def workspace_path
        machine.config.workspace.absolute_path
      end
    end
  end
end
