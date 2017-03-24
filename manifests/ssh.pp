class env::ssh ($home_dir) {
  class { '::ssh':} ->
	::ssh::client::config::user { 'malnick':
		ensure 							=> present,
		user_home_dir 			=> '/home/malnick',
		manage_user_ssh_dir => false,
		require							=> User['malnick'],
		options 						=> {
			'StrictHostKeyChecking' => 'no',
			'UserKnownHostsFile'		=> '/dev/null',
		}
	}
}
