class env::packages(
  $home_dir
){
  include ::tmux
  include ::docker

  $required_pkgs = {
    'apache2-utils'                 => {'ensure' => 'present'},
    'protobuf-c-compiler'           => {'ensure' => 'present'},
    'golang-goprotobuf-dev'         => {'ensure' => 'present'},
    'python-protobuf'               => {'ensure' => 'present'},
    'build-essential'               => {'ensure' => 'present'},
    'tree'                          => {'ensure' => 'present'},
    'vagrant'                       => {'ensure' => 'present'},
    'virtualbox'                    => {'ensure' => 'present'},
  } 
  
  create_resources(package, $required_pkgs)
}
