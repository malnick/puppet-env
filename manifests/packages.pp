class env::packages(
  $home_dir
){
  class { '::tmux': }
  class { 'nodejs': }

  $required_pkgs = {
    'build-essential'               => {'ensure' => 'present'},
    'tree'                          => {'ensure' => 'present'},
    'nodejs-legacy'                 => {'ensure' => 'present'},
    'xserver-xorg-input-synaptics'  => {'ensure' => 'absent'},
    'xserver-xorg-input-libinput'   => {'ensure' => 'present'},
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
