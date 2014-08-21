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
  class { '::ssh::server':}
  class { '::ssh::client':}

  class { '::ntp':
    servers => [ 
    'ntp1.simnet.is', 
    'ntp2.simnet.is', 
    'ntp3.simnet.is', 
    '0.rhel.pool.ntp.org',
    '1.rhel.pool.ntp.org',
    '2.rhel.pool.ntp.org',
    '3.rhel.pool.ntp.org'
    ],

  }
}
