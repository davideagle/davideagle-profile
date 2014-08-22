# == Class: profile::base
#
# Base profile
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
#  include profile::base
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2014 Rob Nelson
#
class profile::base {
  
  ## Hiera lookups
  $ntp_servers        = hiera('ntp::servers')
  $rsyslog_host       = hiera('rsyslog::client::host')
  $rsyslog_pattern    = hiera('rsyslog::client::pattern')
  
  
  include ::motd

  # SSH server and client
  include ::ssh::server
  include ::ssh::client
  
  class {'::ntp':
    servers => $ntp_servers
  }

  class { '::nagios::client':
    nrpe_allowed_hosts => '127.0.0.1,194.105.253.31,172.21.66.222',
    
  }
  
  class { 'rsyslog::client': 
    remote_servers => [
    {
      host      => $rsyslog_host,
      pattern   => $rsyslog_pattern,
    },
  ]
  }

}
