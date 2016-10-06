# == Class: timezone_win
#
# Full description of class timezone_win here.
#
# === Parameters
#
# [*timezone*]
#   The timezone to use. For a full list of available timezone run tzutil /l.
#   Use the listed time zone ID (e.g. 'Eastern Standard Time')
#
# === Examples
#
#  class { timezone:
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

  exec { 'set-timezone':
    command  => "tzutil /s '${timezone}'",
    onlyif   => "if ((Get-WmiObject -Class win32_timezone).StandardName -eq '${timezone}') {exit 1}",
    provider => powershell,
  }

}