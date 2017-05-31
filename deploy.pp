node vagrant_box_work {
	exec { maven_deploy:
		command   => 'mvn clean scm:checkout install deploy',
		cwd 	  => '/home/vagrant/test/',
		path	  =>  [ '/home/vagrant/apache-maven-3.5.0/bin', '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
		logoutput =>  true,
	}
}
