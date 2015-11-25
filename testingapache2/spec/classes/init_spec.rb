require 'spec_helper'
describe 'testingapache2' do

  context 'with defaults for all parameters' do
    it { should contain_class('testingapache2') }
  end
end
