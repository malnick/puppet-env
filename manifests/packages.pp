class env::packages(
  $home_dir
){
  class { '::tmux': }
  class { 'nodejs': }

  include apt
  apt::ppa { 'ppa:ubuntu-wine/ppa': }

  $required_pkgs = {
    'google-chrome-stable'  => {'ensure' => 'present'},
    'build-essential'       => {'ensure' => 'present'},
    'tree'                  => {'ensure' => 'present'},
    'wine'                  => {'ensure' => 'present'},
    'nodejs-legacy'         => {'ensure' => 'present'},
  } 
  
  create_resources(package, $required_pkgs)

}
