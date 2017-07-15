require 'spec_helper'
describe 'test_foreman' do
  context 'with default values for all parameters' do
    it { should contain_class('test_foreman') }
  end
end
