require 'spec_helper'

ruby_ver = case os[:family]
           when 'debian', 'ubuntu'
             'ruby1.9.1'
           else
             'ruby'
end

describe package(ruby_ver) do
  it { should be_installed }
end

describe file("/usr/bin/#{ruby_ver}") do
  it { should be_file }
  it { should be_executable }
end
