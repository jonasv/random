# --> node definition file, it shouldn't be here

include accounts

resources { "firewall":
	purge => true
}

Firewall {
	before => Class['fw::post'],
	require => Class['fw::pre'],
}

class { ['fw::pre', 'fw::post']: }



node 'puppetnode001.int.corosay.com' {


realize (Accounts::Virtual['test2'])

}
