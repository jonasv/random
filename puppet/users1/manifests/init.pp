class users1 {
  user { 'tester':
    ensure => present,
    home => '/home/tester',
    shell => '/bin/bash',
    managehome => true,
    password => '$1$kUG9eAEa$SRJ0AB0UFWH65NIETCv781',
  }
}

