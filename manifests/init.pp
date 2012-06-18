class radius {
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
}
