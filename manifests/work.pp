node default {
	class{ '::deploy': 
		cwd       => '/vagrant',       
        	settings_path => '/vagrant/settings.xml' 

	}
}
