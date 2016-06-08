class memcached {    
  package { 'memcached':
    ensure => present,
  }
  
  file { '/etc/sysconfig/memcached':
    ensure  => file,
    source  => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  
  service { 'memcached':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/sysconfig/memcached'],
  } 
}
