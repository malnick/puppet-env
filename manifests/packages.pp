class env::packages(
  $home_dir
){
  include docker
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
  
  create_resources(package, $required_pkgs)

}
