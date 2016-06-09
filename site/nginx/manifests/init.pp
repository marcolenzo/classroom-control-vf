class nginx {

	package { 'nginx':
		ensure => 'present',
	}

	file { '/etc/nginx/nginx.conf':
		ensure => 'file',
		source => 'puppet:///modules/nginx/nginx.conf',
		owner => 'root',
		group => 'root',
		mode => '0644',
		require => Package['nginx'],
	}

	file { '/etc/nginx/conf.d':
	    ensure => directory,
	    owner  => 'root',
	    group  => 'root',
	    mode   => '0775',
	}

	file { '/etc/nginx/conf.d/default.conf':
		ensure => file,
		source => 'puppet:///modules/nginx/default.conf',
		owner => 'root',
		group => 'root',
		mode => '0644',
		require => Package['nginx'],
	}

	file { '/var/www':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => '0775',
	}

	file { '/var/www/index.html':
		ensure => file,
	 	source => 'puppet:///modules/nginx/index.html',
	 	owner  => 'root',
	 	group  => 'root',
	 	mode   => '0664',
	}

	service { 'nginx':
		ensure => running,
		enable => true,
	}
	
}