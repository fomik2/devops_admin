# This code deploy RPM to Nexus when vagrant machine is start 

node default {
  class{ '::deploy': 
    cwd       => '/vagrant',                  # Where Pom.xml is located on VM (RSync folder)    
    settings_path => '/vagrant/settings.xml', # Where settings.xml is located on VM (RSync folder)
  }
}

