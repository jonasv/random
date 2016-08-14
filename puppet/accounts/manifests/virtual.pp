define accounts::virtual ($ensure,$uid,$realname,$pass,$sshkeytype,$homepath,$shell,$sshkey) {

  # Create the user
  user { $title:
    ensure            =>  $ensure,
    uid		      =>  $uid,
    gid               =>  $title,
    shell             =>  $shell,
    home              =>  "${homepath}/${title}",
    comment           =>  $realname,
    password          =>  $pass,
    managehome        =>  true,
    require           =>  Group[$title],
    purge_ssh_keys    =>  true,
  }

  # Create a matching group
  group { $title:
    gid               => $uid,
  }

 if $ensure == 'present' {
  # Ensure the home directory exists with the right permissions
  file { "${homepath}/${title}":
    ensure            =>  directory,
    owner             =>  $title,
    group             =>  $title,
    mode              =>  '0750',
    require           =>  [ User[$title], Group[$title] ],
  }

  # Ensure the .ssh directory exists with the right permissions
  file { "${homepath}/${title}/.ssh":
    ensure            =>  directory,
    owner             =>  $title,
    group             =>  $title,
    mode              =>  '0700',
    require           =>  File["${homepath}/${title}"],
  }

  # Add user's SSH key
  if ($sshkey != '') {
    ssh_authorized_key {$title:
      ensure          => present,
      name            => $title,
      user            => $title,
      type            => $sshkeytype,
      key             => $sshkey,
    }
  }
 }
}