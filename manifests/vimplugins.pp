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
		},
    'airline' => {
      'source' => 'https://github.com/vim-airline/vim-airline.git'
    },
    'dockerfile' => {
      'source' => 'https://github.com/ekalinin/Dockerfile.vim'
    },
    'json' => {
      'source' => 'https://github.com/elzr/vim-json'
    },
    'puppet' => {
      'source' => 'https://github.com/rodjek/vim-puppet'
    },
    'syntastic' => {
      'source' => 'https://github.com/rodjek/vim-puppet'
    },
    'airline-themes' => {
      'source' => 'https://github.com/vim-airline/vim-airline-themes'
    },
    'flake8' => {
      'source' => 'https://github.com/nvie/vim-flake8'
    },
    'gitgutter' => {
      'source' => 'https://github.com/airblade/vim-gitgutter'
    },
    'go' => {
      'source' => 'https://github.com/fatih/vim-go'
    },
    'vagrant' => {
      'source' => 'https://github.com/hashivim/vim-vagrant'
    },
    'rust' => {
      'source' => 'https://github.com/rust-lang/rust.vim'
    },
    'vim-instant-markdown' => {
      'source' => 'https://github.com/suan/vim-instant-markdown'
    },
	}

	create_resources(vim::plugin, $plugins)

}
