module VagrantWorkspace
  class Plugin < Vagrant.plugin('2')
    name 'Vagrant Workspace'
    description <<-DESC
      This plugin allows you to load and execute workspace configuration files.
      These configuration files simplify the workflow of working with multiple projects.
    DESC

    command 'workspace' do
      require_relative 'command'
      Command
    end

    config 'workspace' do
      require_relative 'config'
      Config
    end
  end
end
