# == Class: timezone_win
#
#   Manage the timezone on windows systems. Use WMI to verify what the timezone
#   currently is and tzutil.exe to set it.
#
# === Parameters
#
# [*timezone*]
#   The timezone to use. For a full list of available timezone run tzutil /l.
#   Use the listed time zone ID (e.g. 'Eastern Standard Time')
#
# === Examples
#
#  class { ::timezone_win:
#    timezone = 'Mountain Standard Time',
#  }
#
# === Authors
#
# Joey Piccola <joey@joeypiccola.com>
#
# === Copyright
#
# Copyright (C) 2016 Joey Piccola.
#
class timezone_win (

  $timezone,

){

  # parameter validation
  validate_string($timezone)

  exec { 'set-timezone':
    command  => "tzutil /s '${timezone}'",
    onlyif   => "if ((Get-WmiObject -Class win32_timezone).StandardName -eq '${timezone}') {exit 1}",
    provider => powershell,
  }

}