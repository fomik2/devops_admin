require 'spec_helper'

describe 'nginx' do

  let(:title) { 'nginx' }
  let(:node) { 'foreman.test.com' }

  it { is_expected.to compile } 
  it { is_expected.to contain_package('nginx').with(ensure: 'present') } 
  it { is_expected.to contain_file('/var/www/index.html') }

end
