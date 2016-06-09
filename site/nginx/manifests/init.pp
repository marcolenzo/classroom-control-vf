class nginx {

	File {
		owner => 'root',
		group => 'root',
		mode => '0664',
	}

	package { 'nginx':
		ensure => 'present',
	}

	file { '/etc/nginx/nginx.conf':
		ensure => 'file',
		source => 'puppet:///modules/nginx/nginx.conf',
		require => Package['nginx'],
		notify  => Service['nginx'],
	}

	file { '/etc/nginx/conf.d':
	    ensure => directory,
	}

	file { '/etc/nginx/conf.d/default.conf':
		ensure => file,
		source => 'puppet:///modules/nginx/default.conf',
		require => Package['nginx'],
		notify  => Service['nginx'],
	}

	file { '/var/www':
		ensure => directory,
	}

	file { '/var/www/index.html':
		ensure => file,
	 	source => 'puppet:///modules/nginx/index.html',
	}

	service { 'nginx':
		ensure => running,
		enable => true,
	}

}