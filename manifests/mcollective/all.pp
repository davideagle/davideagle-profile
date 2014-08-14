# Comments go here
class profile::mcollective::all {
  class { '::mcollective':
    client             => true,
    middleware         => true,
    middleware_hosts   => [ 'puppet.local' ],
    middleware_ssl     => true,
    securityprovider   => 'ssl',
    ssl_client_certs   => 'puppet:///modules/site_mcollective/client_certs',
    ssl_ca_cert        => 'puppet:///modules/site_mcollective/certs/ca.pem',
    ssl_server_public  => 'puppet:///modules/site_mcollective/certs/puppet.local.pem',
    ssl_server_private => 'puppet:///modules/site_mcollective/private_keys/puppet.local.pem',
  }

  mcollective::plugin { 'puppet':
    package => true,
  }
}
