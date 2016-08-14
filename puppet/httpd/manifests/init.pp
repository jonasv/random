class httpd {

	firewall { '000 allow httpd traffic':
      chain => 'INPUT',
      proto => 'tcp',
      dport => '80',
      action => 'accept',
  }

	package { 'httpd':
		ensure => present,
	}

	service { 'httpd':
		ensure => running,
	}
}

