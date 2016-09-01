class env (
  $home_dir        = $::env::homedir,
) inherits ::env::params {
  class { ::env::base:
    home_dir => $home_dir
  }
}
