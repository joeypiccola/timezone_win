require 'spec_helper'
describe 'timezone_win' do

  context 'with defaults for all parameters' do
    it { should contain_class('timezone_win') }
  end
end
