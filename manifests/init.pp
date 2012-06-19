class radius (
  $radius_clients
) {
  package {
    'freeradius2':
      ensure => installed,
  }
  service {
    'radiusd':
      ensure    => running,
      hasstatus => true,
      require   => Package['freeradius2'],
  }
  file {
    '/etc/raddb/clients.conf':
      ensure  => present,
      content => template('radius/clients.conf.erb'),
      require => Package['freeradius2'],
      notify  => Service['radiusd'],
  }
}
