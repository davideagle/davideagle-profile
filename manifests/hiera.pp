class profile::hiera {
  package { ['hiera', 'hiera-puppet']:
    ensure => present,
  }
}
