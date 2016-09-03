class env::packages(
  $home_dir
){
  class { '::tmux': }
  class { 'nodejs': }

  include apt
  apt::ppa { 'ppa:ubuntu-wine/ppa': }
  apt::key { 'spotify':
    id      => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
    server  => 'hkp://keyserver.ubuntu.com:80',
  }

  $required_pkgs = {
    'google-chrome-stable'  => {'ensure' => 'present'},
    'build-essential'       => {'ensure' => 'present'},
    'tree'                  => {'ensure' => 'present'},
    'wine'                  => {'ensure' => 'present'},
    'nodejs-legacy'         => {'ensure' => 'present'},
    'spotify-client'        => {'ensure' => 'present'},
  } 
  
  create_resources(package, $required_pkgs)

}
