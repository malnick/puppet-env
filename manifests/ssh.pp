class env::ssh ($home_dir) {
	::ssh::client::config::user { 'malnick':
		ensure 							=> present,
    manage_user_ssh_dir => false,
		options 						=> {
			'StrictHostKeyChecking' => 'no',
			'UserKnownHostsFile'		=> '/dev/null',
		}
	}
}
