module VagrantWorkspace
  class Plugin < Vagrant.plugin('2')
    name 'Vagrant Workspace'
    description <<-DESC
      This plugin allows you to save and load workspace configuration files.
      These configuration files simplify the workflow of switching git branches,
      when you work on multiple projects at once.
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
