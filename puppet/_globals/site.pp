
resources { "firewall":
          purge => true
}

Firewall {
          before => Class['fw::post'],
          require => Class['fw::pre'],
}

class { ['fw::pre', 'fw::post']: }



node 'puppetnode001.int.corosay.com' {
    file { '/tmp/xxxa':
         content => "f",
         ensure => "present",       
    }


       include httpd
     # include users1
     # include users2
       include accounts
     realize (Accounts::Virtual['jsmith'])
}
