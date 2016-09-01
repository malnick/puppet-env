class env::vimplugins (
  $home_dir,
) {
  
  class { "vim": 
    user => "malnick",
    home_dir => $home_dir,
  }

	$plugins = {
		'nerdtree' => {
			'source' => "https://github.com/scrooloose/nerdtree.git"
		},
		'solarized' => {
			'source' => 'https://github.com/altercation/vim-colors-solarized.git'
		}
	}

	create_resources(vim::plugin, $plugins)

}
