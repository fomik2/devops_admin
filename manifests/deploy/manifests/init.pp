# Class: deploy
# ===========================
#
# Full description of class deploy here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'deploy':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class deploy (
	$cwd 		 = $deploy::params::cwd,
	$settings_path   = $deploy::params::settings_path

) inherits deploy::params {


	package {'apache-maven':
        ensure => installed,
        name   => apache-maven
        }


        exec { maven_deploy:
                command   => "mvn clean scm:checkout install --settings ${settings_path}  deploy",
                cwd       => "${cwd}",
                path      =>  ['/usr/local/bin', '/usr/bin', '/usr/local/sbin', '/usr/sbin', '/home/vagrant/.local/bin', '/home/vagrant/bin'],
                logoutput =>  true,
                require => Package['apache-maven'],
        }


} 
