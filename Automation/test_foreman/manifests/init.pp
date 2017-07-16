
class test_foreman {
  
 
  $query = { item   => 'hosts',
            search => 'hostgroup = Jenkins',
            foreman_url  => 'https://foreman.test.com',
            foreman_user => 'admin',
            foreman_pass => '20hRKS97' }

  $result = foreman($query)['results']

  
  file {'/tmp/test.conf':
    ensure   => present,
    content => template('test_foreman/test.erb')
  }

}

