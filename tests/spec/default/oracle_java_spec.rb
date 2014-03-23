require 'spec_helper'

describe package('oracle-java7-installer') do
  it { should be_installed }
end
