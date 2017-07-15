
class test_foreman {
  

  
  $query = { item   => 'fact_values',
            search => 'fact = ipaddress and host ~ jenkins',
            foreman_url  => 'https://foreman.test.com',
            foreman_user => '',
            foreman_pass => '' }

  $jenkins = foreman($query)["results"]
  
#  $jenkins['results'].map { |k,v| puts v['ipaddress'] }  
  
  file {'/tmp/test.conf':
    ensure   => present,
    content => template('test_foreman/test.erb')
  }

}

