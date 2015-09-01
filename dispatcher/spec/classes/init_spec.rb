require 'spec_helper'
describe 'dispatcher' do

  context 'with defaults for all parameters' do
    it { should contain_class('dispatcher') }
  end
end
