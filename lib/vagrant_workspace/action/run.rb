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
        workspace_hash.each do |project_name, project|
          next if project_name == '_all'

          puts "Executing commands on #{project_name}:"
          execute(project_name, before_commands)
          execute(project_name, project['run'])
          execute(project_name, after_commands)
        end
        app.call(env)
      end

      private

      def execute(project_name, commands)
        commands.each do |command|
          puts "$ #{command}"
          machine.communicate.execute "cd #{path(project_name)} && #{command}"
        end
      end

      def before_commands
        return [] unless workspace_hash['_all']
        return [] unless workspace_hash['_all']['before']
        workspace_hash['_all']['before']
      end

      def after_commands
        return [] unless workspace_hash['_all']
        return [] unless workspace_hash['_all']['after']
        workspace_hash['_all']['after']
      end

      def workspace_hash
        @workspace_hash ||= YAML.load_file(workspace_file)
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
