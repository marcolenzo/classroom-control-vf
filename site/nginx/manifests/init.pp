class nginx (
	 $root = undef,
	 $default_docroot = '/var/www',
)
{

	$docroot = $root ? {
	   undef   => $default_docroot,
	   default => $root,
	}

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

	file { "${docroot}":
		ensure => directory,
	}

	file { "${docroot}/index.html":
		ensure => file,
	 	source => 'puppet:///modules/nginx/index.html',
	}

	service { 'nginx':
		ensure => running,
		enable => true,
	}

}