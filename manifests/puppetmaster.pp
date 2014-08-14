class profile::puppet_master {
  package {'puppet-server':
    ensure => present,
  }

  firewall { '100 allow agent checkins':
    dport  => 8140,
    proto  => tcp,
    action => accept,
  }

  firewall { '110 sinatra web hook':
    dport  => 80,
    proto  => tcp,
    action => accept,
  }
}
