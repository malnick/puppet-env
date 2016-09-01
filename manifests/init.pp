class env (
  $home_dir = '/home/malnick/', 
) inherits ::env::params {
  
  class { ::env::base:
    home_dir => $home_dir
  }

}
