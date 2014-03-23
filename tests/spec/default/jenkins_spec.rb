require 'spec_helper'

describe package('jenkins') do
  it { should be_installed.by('apt') }
end

describe port(8080) do
  it { should be_listening.with('tcp')  }
end

describe service('jenkins') do
  it { should be_enabled.with_level(3) }
  it { should be_running }
end

describe process("java") do
  its(:args) { should match /jenkins/ }
end
