# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'
describe 'davita_timezone' do
  let(:facts) {{
    :concat_basedir         => '/var/tmp',
  }}
  let(:params) {{
    :timezone => 'blah',
  }}
  it { should compile }
  
  it { should contain_exec('set-timezone').with(
    'command' => "tzutil /s 'blah'",
    'onlyif'  => "if ((Get-WmiObject -Class win32_timezone).StandardName -eq 'blah') {exit 1}",
    )
  }
  
end