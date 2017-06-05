require 'spec_helper'
describe 'deploy_nexus' do
  context 'with default values for all parameters' do
    it { should contain_class('deploy_nexus') }
  end
end
