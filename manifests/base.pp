class base (
  $home_dir,
){
  $required_dirs = [
    "${home_dir}/projects",
    "${home_dir}/personal",
    "${home_dir}/temp",
  ]

  $required_pkgs = [
    'google-chrome-stable',
    'build-essential',
    'tmux',
  ]

  $required_dirs.each |$dir| {
    file { $dir:
      ensure => directory
    }
  }

  $required_pkgs.each |$pkg| {
    package { $pkg:
      ensure => installed
    }
  }
}
