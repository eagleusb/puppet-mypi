require 'spec_helper'
describe 'mypi' do

  context 'with defaults for all parameters' do
    it { should contain_class('mypi') }
  end
end
