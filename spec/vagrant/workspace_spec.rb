require 'spec_helper'

describe Vagrant::Workspace do
  it 'has a version number' do
    expect(Vagrant::Workspace::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
