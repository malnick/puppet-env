class env::base (
  $home_dir,
){
  class { 'ohmyzsh': }

  user { 'malnick':
    ensure      =>  present,
		password		=> '$6$xLn/pEur$HloKijb71ny8TEnjZZX9fCpM2qLE03FvPWNTHW/ouieBmbloX2H.05FTe/.I6zo/N7cOHBx/tj2lZWd5BnmKX1',
    managehome  => true,
    shell       => '/bin/zsh',
    require     => Class['ohmyzsh'],
  }

  user { 'root':
    ensure   => present,
    password => '$6$xLn/pEur$HloKijb71ny8TEnjZZX9fCpM2qLE03FvPWNTHW/ouieBmbloX2H.05FTe/.I6zo/N7cOHBx/tj2lZWd5BnmKX1',
    shell    => '/bin/zsh',
    require  => Class['ohmyzsh'],
    uid      => '0',
  }

	sudo::conf { 'malnick':
     ensure  => present,
     content => '%malnick ALL=(ALL) ALL',
  }

  $file_defaults = {
    ensure  => directory,
    require => User['malnick'],
    owner   => 'malnick',
    mode    => 0755,
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
