# Comments go here
class profile::mcollective::users {
  user { 'root':
    ensure => present,
  } ->
  mcollective::user { 'root':
    homedir     => '/root',
    certificate => 'puppet:///modules/site_mcollective/client_certs/root.pem',
    private_key => 'puppet:///modules/site_mcollective/private_keys/root.pem',
  }
}
