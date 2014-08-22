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
  include ::motd

  # SSH server and client
  include ::ssh::server
  include ::ssh::client
  
  include ::ntp
  $ntpservers = hiera('ntp::servers', {})
  create_resources('ntp::servers', $ntpservers)

  class { '::nagios::client':
    nrpe_allowed_hosts => '127.0.0.1,194.105.253.31,172.21.66.222',
    
  }
  
  class { 'rsyslog::client': 
    remote_servers => [
    {
      host      => 'logs.simnet.is',
      pattern   => 'auth.*,authpriv.*',
    },
  ]
  }

}
