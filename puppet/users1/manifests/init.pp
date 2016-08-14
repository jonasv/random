class users1 {
  user { 'iskorptix':
    ensure => present,
    home => '/home/iskorptix',
    shell => '/bin/bash',
    managehome => true,
    password => '$1$kUG9eAEa$SRJ0AB0UFWH65NIETCv781',
  }
}

