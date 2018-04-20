require 'spec_helper'

describe 'timezone_win' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'passes with minimal params' do
        let(:params) { { timezone: 'Mountain Standard Time' } }

        it {
          is_expected.to contain_exec('set_timezone').with(
            'command'  => "tzutil /s 'Mountain Standard Time'",
            'onlyif'   => "if ((tzutil /g) -eq 'Mountain Standard Time') {exit 1}",
            'provider' => 'powershell',
          )
        }

        it { is_expected.to compile }
      end
    end
  end
end
