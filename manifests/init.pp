class env (
  $home_dir = '/home/malnick', 
) inherits ::env::params {
  
  class { ::env::base:        home_dir => $home_dir }->
  class { ::env::packages:    home_dir => $home_dir }-> 
  class { ::env::vimplugins:  home_dir => $home_dir }->
  class { ::env::go:          home_dir => $home_dir }->
  class { ::env::py:          home_dir => $home_dir }->
  class { ::env::dotfiles:    home_dir => $home_dir }

}
