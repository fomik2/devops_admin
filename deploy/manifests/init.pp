# Deploy Class install soft on test vagrant virtual machine, install maven, download source code from Github repo, build and deploy it to Nexus Repositary.
# pom.xml and setting.xml are represent in vagrant directory
# use puppet-yum plugin for group install

class deploy (
  $cwd = $deploy::params::cwd,
  $settings_path = $deploy::params::settings_path

) inherits deploy::params {

    package { 'puppet-lint':
      ensure   => '1.1.0',
      provider => 'gem',
    }

    package {'git':
      ensure => installed,
      name   => git,
    }

    yum::group {'Development Tools':
      ensure => present,
      before => Package['apache-maven'],
    }

    $devtools = [ 'curl-devel', 'expat-devel', 'gettext-devel', 'openssl-devel', 'zlib-devel' ]

    package { $devtools:
      ensure => installed,
      before => Package['apache-maven'],
    }


    package {'wget':
      ensure => installed,
      name   => wget,
    }

    package {'java-1.8.0-openjdk-devel':
      ensure => installed,
      name   => 'java-1.8.0-openjdk-devel',
      before => Package['apache-maven'],
    }


    exec { 'repo-maven':
      command => 'sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo',
      path    => ['/usr/local/bin', '/usr/bin', '/usr/local/sbin', '/usr/sbin', '/home/vagrant/.local/bin', '/home/vagrant/bin'],
      require => Package['wget'],
    }


    exec { 'sed_execute':
      command => 'sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo',
      path    => ['/usr/local/bin', '/usr/bin', '/usr/local/sbin', '/usr/sbin', '/home/vagrant/.local/bin', '/home/vagrant/bin'],
      require => Exec['repo-maven'],
    }

    package {'apache-maven':
      ensure  => installed,
      name    => apache-maven,
      require => Exec['sed_execute'],
    }


    exec { 'maven_deploy':
      command   => "mvn clean scm:checkout install --settings ${settings_path}  deploy",
      cwd       => "${cwd}",
      path      => ['/usr/local/bin', '/usr/bin', '/usr/local/sbin', '/usr/sbin', '/home/vagrant/.local/bin', '/home/vagrant/bin'],
      logoutput =>  true,
      require   => Package['apache-maven'],
    }

}
