require 'spec_helper'

describe 'test_foreman' do
  let(:title) { 'test_foreman' }

  let(:params) { {
    :item         => 'hosts',
    :search       => 'hostgroup = Jenkins',
    :foreman_url  => 'https://foreman.test.com',
    :foreman_user => 'admin',
    :foreman_pass => '20hRKS97'
  } }


  it { is_expected.to contain_file('/tmp/test.conf') }

end
