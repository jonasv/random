class fw::post {

# CHAIN -> OUTPUT

firewall { '000 accept connections':
    chain => 'OUTPUT',
    proto  => 'all',
    state  => ['NEW', 'RELATED', 'ESTABLISHED'],
    action => 'accept',
    before => undef,
  }

 firewall { "65535 deny all other output requests":
    chain      => 'OUTPUT',
    action     => 'drop',
    proto      => 'all',
    before     => undef,
  }



}
