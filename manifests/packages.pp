class env::packages(
  $home_dir
){
  class { '::tmux': }
  class { 'nodejs': }

  include apt
  apt::key { 'spotify':
    id      => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
    server  => 'hkp://keyserver.ubuntu.com:80',
  }
  
  package { 'spotify-client': 
    ensure  => present,
    require => Apt::key['spotify'],
  }

  $required_pkgs = {
    'google-chrome-stable'  => {'ensure' => 'present'},
    'build-essential'       => {'ensure' => 'present'},
    'tree'                  => {'ensure' => 'present'},
    'nodejs-legacy'         => {'ensure' => 'present'},
  } 
  
  create_resources(package, $required_pkgs)

}
