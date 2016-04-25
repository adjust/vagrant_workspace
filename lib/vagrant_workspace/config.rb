module VagrantWorkspace
  class Config < Vagrant.plugin(2, :config)
    attr_accessor :absolute_path

    def initialize
      @absolute_path = UNSET_VALUE
    end

    def finalize!
      @absolute_path = '/home/vagrant' if @absolute_path == UNSET_VALUE
    end
  end
end
