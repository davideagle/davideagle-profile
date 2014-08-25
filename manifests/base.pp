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
# davidoj <davidoj0@siminn.is>
#
# === Copyright
#
# Siminn
#
class profile::base {
  
  ## Hiera lookups
  $ntp_servers          = hiera('ntp::servers')
  $rsyslog_host         = hiera('rsyslog::client::host')
  $rsyslog_pattern      = hiera('rsyslog::client::pattern')
  $nrpe_allowed_hosts   = hiera('nagios::client::nrpe_allowed_hosts')
  $users_utkerfi        = hiera('users_utkerfi')
  
  include ::motd

  # SSH server and client
  include ::ssh::server
  include ::ssh::client
  
  class users (
    $myusers,
    $mygroups,
  ){
    create_resources(user, $users_utkerfi)
  }
  
  users { utkerfi: }
  
  class {'::ntp':
    servers => $ntp_servers
  }

  class { '::nagios::client':
    nrpe_allowed_hosts => $nrpe_allowed_hosts,
    
  }
  
  class { '::rsyslog::client': 
    remote_servers => [
    {
      host      => $rsyslog_host,
      pattern   => $rsyslog_pattern,
    },
  ]
  }

}
