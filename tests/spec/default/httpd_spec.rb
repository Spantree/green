require 'spec_helper'

describe package('nginx') do
  it { should be_installed.by('apt') }
end

describe port(80) do
  it { should be_listening.with('tcp')  }
end

describe service('nginx') do
  it { should be_enabled.with_level(3) }
end

describe process("nginx") do
  it { should be_running }
end
