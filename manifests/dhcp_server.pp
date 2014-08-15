class profile::dhcp_server {
  include mss::base
  include dhcp::server

  firewall { '100 Allow DHCP requests':
    proto  => 'udp',
    sport  => [67, 68],
    dport  => [67, 68],
    state  => 'NEW',
    action => 'accept',
  }
}
