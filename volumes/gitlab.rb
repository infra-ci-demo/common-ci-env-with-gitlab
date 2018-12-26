external_url 'http://10.208.81.221'
registry_external_url 'http://10.208.81.221:4567'
gitlab_rails['time_zone'] = 'Asia/Tokyo'
gitlab_rails['initial_root_password'] = 'redhat'
gitlab_rails['initial_shared_runners_registration_token'] = 'token-AABBCCDDEE'
gitlab_rails['gitlab_shell_ssh_port'] = 22
unicorn['worker_timeout'] = 60
unicorn['worker_processes'] = 3
gitlab_rails['registry_enabled'] = true
