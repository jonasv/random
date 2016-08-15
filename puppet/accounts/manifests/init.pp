class accounts {

# @ symbol is crucial here

 @accounts::virtual { 'jsmith':
	ensure		=>  'present',
	uid		=>  '5001',
	realname        =>  'John Smith',
	homepath	=>  '/home',
	shell		=>  '/bin/bash',
	pass            =>  '*',
	sshkeytype      =>  'ssh-rsa',
	sshkey          =>  'AAAAB3NzaC1yc2EAAAADAQABAAABAQDS4HIVV0LlpiAsx+TYPvltRiVs8rAbbNZW2/Gl/GFZw3Og8OuaTyK6r72iRn+Xo+8sH9MmeXiS0DeotdNcyXwvJIYm/F0/irpDHHvzkVZnEXK0tUj9BeZGDA8jymmGCTpYlUUT/M813MCdj7H8n7Rju26bMFRRmO4JOCHzcm+diDgRz2fFz/3Mcbt0h3x+xqoH+OD5KdvnbRw74rl734L//juCgaZD0AhYDxAMPtUT+p4Fon/IeqgmOJKCWLFEC0j/dsYVlyKjuirBevLQc8eqENVfyyjnQ7HknFylDCg66g9MCSkiD71fY9eSZLl7dWHeToMI7y5Su3urk8O7hVgP',
    }
 @accounts::virtual { 'test2':
        ensure          =>  'present',
        uid             =>  '5002',
        realname        =>  'John2 Smith2',
        homepath        =>  '/home',
        shell           =>  '/bin/bash',
        pass            =>  '*',
        sshkeytype      =>  'ssh-rsa',
        sshkey		=>  'AAAAB3NzaC1yc2EAAAADAQABAAABAQDRlFLIqgSgX8iw5OyYmC2k1+NFGVrb8uGN99hqV9udqDJvTA74/zb4aW54JP5zJigKRjl6kRD+a4KaTcy8tHxHVxPWUBDpRCOToj8XbhaodYYti3XOOq0wqhB885FypxV+Di6hOBD4fecfauMa3pZRcwz66S7aIAxoiGfXHcLOvvxrIYfxwUhNlv51kjJ2Ce74BsRtM2lSI5V1apwAPhO8SFPlws8zUu4GcLi7H2YRhbr77YW6+itd8sUxRSOhgvsroXb3qW0gXTbKJ98b/2PQmJuGXEAEcxkrKXGHhdJUD0T+XQUyz7JtrAQKzL38WwI0LnVAcOPeXGKpWPWQwL7z',
    }
 @accounts::virtual { 'test3':
        ensure          =>  'absent',
        uid             =>  '5003',
        realname        =>  'John2 Smith2',
        homepath        =>  '/home',
        shell           =>  '/bin/false',
        pass            =>  '*',
        sshkeytype      =>  'ssh-rsa',
        sshkey          =>  'AAAAB3NzaC1yc2EAAAADAQABAAABAQDRlFLIqgSgX8iw5OyYmC2k1+NFGVrb8uGN99hqV9udqDJvTA74/zb4aW54JP5zJigKRjl6kRD+a4KaTcy8tHxHVxPWUBDpRCOToj8XbhaodYYti3XOOq0wqhB885FypxV+Di6hOBD4fecfauMa3pZRcwz66S7aIAxoiGfXHcLOvvxrIYfxwUhNlv51kjJ2Ce74BsRtM2lSI5V1apwAPhO8SFPlws8zUu4GcLi7H2YRhbr77YW6+itd8sUxRSOhgvsroXb3qW0gXTbKJ98b/2PQmJuGXEAEcxkrKXGHhdJUD0T+XQUyz7JtrAQKzL38WwI0LnVAcOPeXGKpWPWQwL7z',
    }
  
}
#