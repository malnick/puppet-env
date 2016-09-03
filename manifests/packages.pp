class env::packages(
  $home_dir
){
  class { '::tmux': }

  $required_pkgs = {
    'google-chrome-stable'  => {'ensure' => 'present'},
    'build-essential'       => {'ensure' => 'present'},
    'tree'                  => {'ensure' => 'present'},
  } 
  
  create_resources(package, $required_pkgs, $pkg_defaults)

}
