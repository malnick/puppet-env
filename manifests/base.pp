class env::base (
  $home_dir,
){
  class { 'ohmyzsh': }

  user { 'malnick':
    ensure =>  present,
    managehome => true,
    shell => '/bin/zsh',
    require => Class['ohmyzsh'],
  }

  $file_defaults = {
    ensure => directory,
    require => User['malnick'],
  }

  $required_dirs = { 
    "${home_dir}/projects" => {},
    "${home_dir}/personal" => {},
    "${home_dir}/temp" => {},
  }

  create_resources(file, $required_dirs, $file_defaults)
  
  $required_pkgs = [
    'google-chrome-stable',
    'build-essential',
    'tmux',
  ]

}
