class accounts {
    accounts::virtual { 'jsmith':
	ensure		=>  'absent',
	uid		=>  '5001',
	realname        =>  'John Smith',
	homepath	=>  '/home',
	shell		=>  '/bin/bash',
	pass            =>  '*',
	sshkeytype      =>  'ssh-rsa',
	sshkey          =>  'AAAAB3NzaC1yc2EAAAADAQABAAABAQDS4HIVV0LlpiAsx+TYPvltRiVs8rAbbNZW2/Gl/GFZw3Og8OuaTyK6r72iRn+Xo+8sH9MmeXiS0DeotdNcyXwvJIYm/F0/irpDHHvzkVZnEXK0tUj9BeZGDA8jymmGCTpYlUUT/M813MCdj7H8n7Rju26bMFRRmO4JOCHzcm+diDgRz2fFz/3Mcbt0h3x+xqoH+OD5KdvnbRw74rl734L//juCgaZD0AhYDxAMPtUT+p4Fon/IeqgmOJKCWLFEC0j/dsYVlyKjuirBevLQc8eqENVfyyjnQ7HknFylDCg66g9MCSkiD71fY9eSZLl7dWHeToMI7y5Su3urk8O7hVgP',
    }
}
