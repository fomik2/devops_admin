# Params for test foreman function: you can assign password, login and search string.

class test_foreman::params {

  $item         = 'hosts'
  $search       = 'hostgroup = Jenkins'
  $foreman_url  = 'https://foreman.test.com'
  $foreman_user = 'YOUR LOGIN HERE'
  $foreman_pass = 'YOUR PASS HERE'

}
