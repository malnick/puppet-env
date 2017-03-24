class env::ssh ($home_dir) {
  file { '/home/malnick/.ssh':
    ensure => directory,
  }

  class { 'ssh::client':
    storeconfigs_enabled => false,
  }

	::ssh::client::config::user { 'malnick':
		ensure 							=> present,
    manage_user_ssh_dir => false,
		options 						=> {
			'StrictHostKeyChecking' => 'no',
			'UserKnownHostsFile'		=> '/dev/null',
		},
    require             => File['/home/malnick/.ssh'],
	}
}
