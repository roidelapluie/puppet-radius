class radius::ldap (
  $ldap_server,
  $ldap_basedn,
  $ldap_filter
) {
  package{
    'freeradius2-ldap':
      ensure  => installed
      require => Package['freeradius2']
  }
  file{
    '/etc/raddb/modules/ldap':
      ensure  => present,
      content => template('radius/ldap.erb'),
      notify  => Service['radiusd'],

  }
}
