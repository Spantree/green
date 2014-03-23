require 'spec_helper'

java='/usr/lib/jvm/java-7-oracle//bin/java'

describe package('oracle-java7-installer') do
  it { should be_installed }
end

describe file(java) do
  it { should be_executable }
  it { should be_file }
end
