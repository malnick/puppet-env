class env::ssh ($home_dir) {
  class { 'ssh::client':
    storeconfigs_enabled => false,
  }

	::ssh::client::config::user { 'malnick':
		ensure 							=> present,
    manage_user_ssh_dir => false,
		options 						=> {
			'StrictHostKeyChecking' => 'no',
			'UserKnownHostsFile'		=> '/dev/null',
		}
	}
}
