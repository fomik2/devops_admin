# Params for Deploy class

class deploy::params {
  $cwd           = '/vagrant'
  $path          =  [ '/bin/', '/sbin/' , '/usr/bin/']
  $settings_path = '/vagrant/settings.xml'
}
