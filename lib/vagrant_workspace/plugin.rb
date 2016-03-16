module VagrantWorkspace
  class Plugin < Vagrant.plugin('2')
    name 'Vagrant Workspace'

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
