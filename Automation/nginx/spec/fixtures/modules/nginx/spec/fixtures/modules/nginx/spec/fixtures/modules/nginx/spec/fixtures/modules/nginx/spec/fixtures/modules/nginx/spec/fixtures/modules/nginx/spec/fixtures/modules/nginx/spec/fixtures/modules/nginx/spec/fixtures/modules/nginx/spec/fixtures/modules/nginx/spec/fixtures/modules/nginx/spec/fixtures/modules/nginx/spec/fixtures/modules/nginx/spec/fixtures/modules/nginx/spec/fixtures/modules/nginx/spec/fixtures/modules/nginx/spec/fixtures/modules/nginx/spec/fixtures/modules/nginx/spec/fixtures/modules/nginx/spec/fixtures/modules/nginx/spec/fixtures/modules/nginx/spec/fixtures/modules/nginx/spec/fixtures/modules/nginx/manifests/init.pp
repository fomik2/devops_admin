class nginx
 
{

  package { 'nginx':
    ensure => present,
  }

  file { '/var/www/index.html':
    ensure  => file,
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }

}
