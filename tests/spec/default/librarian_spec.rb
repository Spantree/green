require 'spec_helper'

librarian_puppet='/usr/local/bin/librarian-puppet'

describe command('which librarian-puppet') do
  it { should return_stdout librarian_puppet }
end

describe file(librarian_puppet) do
  it { should be_file }
  it { should be_executable }
end
