# Test_foreman class make query to Foreman database and fetch any information like ip, hostname and etc.

class test_foreman (
  
  $item = $test_foreman::params::item,
  $search = $test_foreman::params::search,
  $foreman_url = $test_foreman::params::foreman_url,
  $foreman_user = $test_foreman::params::foreman_user,
  $foreman_pass = $test_foreman::params::foreman_pass

) inherits test_foreman::params {
  
 
 
 $query = { item         => "${item}",
            search       => "${search}",
            foreman_url  => "${foreman_url}",
            foreman_user => "${foreman_user}",
            foreman_pass => "${foreman_pass}" }

  $result = foreman($query)['results']

  
  file {'/tmp/test.conf':
    ensure   => present,
    content => template('test_foreman/test.erb')
  }

}

