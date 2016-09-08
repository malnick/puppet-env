class env::base (
  $home_dir,
){
  class { 'ohmyzsh': }
  ohmyzsh::install { ['root', 'malnick']: }->
  file { "${home_dir}/.oh-my-zsh/themes/gitster.zsh-theme":
    source  => 'puppet:///modules/env/gitster.zsh-theme',
  }

  file { "/root/.oh-my-zsh/themes/gitster.zsh-theme":
    source  => 'puppet:///modules/env/gitster.zsh-theme',
  }

	include ssh
	::ssh::client::config::user { 'malnick':
		ensure 							=> present,
		user_home_dir 			=> '/home/malnick',
		manage_user_ssh_dir => false,
		require							=> User['malnick'],
		options 						=> {
			'StrictHostKeyChecking' => 'no',
			'UserKnownHostsFile'		=> '/dev/null',
		}
	}

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
    group   => 'malnick',
    mode    => 0755,
  }

  $required_dirs = { 
    "${home_dir}/projects"                => {},
    "${home_dir}/projects/mesosphere"     => {},

    "${home_dir}/projects/puppet"         => {},
    "${home_dir}/projects/puppet/dev"     => {},
    "${home_dir}/projects/puppet/modules" => {},

    "${home_dir}/personal"                => {},
    "${home_dir}/temp"                    => {},
  }
  
  create_resources(file, $required_dirs, $file_defaults)
  
  
}
