
class test_module {

$hosts = foreman("hostgroup=devops", "state=all")  
#$hosts = foreman("fact=operatingsystem=Centos", "state=all")


  #$hosts = [1,2,3]

  file {'/tmp/test':
    ensure  => present, 
    content => template('test.erb'),
  }
}
