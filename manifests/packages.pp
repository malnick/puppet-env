class env::packages(
  $home_dir
){
  class { '::tmux': }
  class { 'nodejs': }
  class { 'heroku': 
    heroku_client_url  => 'http://assets.heroku.com.s3.amazonaws.com/heroku-client/heroku-client.tgz',
    install_parent_dir => '/usr/local',
    artifact_dir       => '/usr/local/src/heroku',
    link_dir           => '/usr/local/heroku',
    shell              => 'zsh'
  }

  $required_pkgs = {
    'build-essential'               => {'ensure' => 'present'},
    'tree'                          => {'ensure' => 'present'},
    'nodejs-legacy'                 => {'ensure' => 'present'},
    'xserver-xorg-input-synaptics'  => {'ensure' => 'absent'},
    'xserver-xorg-input-libinput'   => {'ensure' => 'present'},
    'vagrant'                       => {'ensure' => 'present'},
    'virtualbox'                    => {'ensure' => 'present'},
    'instant-markdown-d'            => {
      'ensure'    => 'present',
      'provider'  => 'npm',
    }, 
  } 
  
  $libinput_config = '
# Added by scott
Option "Tapping" "True"
Option "DisableWhileTyping" "True"
EndSection

Section "InputClass"
Identifier "libinput touchscreen catchall"
MatchIsTouchscreen "on"
MatchDevicePath "/dev/input/event*"
Driver "libinput"
EndSection'

  file_line { '90-libinput.conf': 
    path    => '/usr/share/X11/xorg.conf.d/90-libinput.conf',
    line    => $libinput_config,
    require => Package['xserver-xorg-input-libinput'],
  }
  
  create_resources(package, $required_pkgs)

}
