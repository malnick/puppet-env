class env::go ($home_dir){
	class {'golang':
		base_dir    	=> "${home_dir}/projects/go", 
		from_repo   	=> true,
		repo_version 	=> 'go1.7',
		goroot      	=> '$GOPATH/bin:/usr/local/go/bin:$PATH',
		workdir     	=> "${home_dir}/projects/",
	} 

  $file_defaults = {
    'ensure' => 'directory',
    'owner'  => 'malnick',
    'group'  => 'malnick',
  }

  $go_paths = {
    "${home_dir}/projects/go" => {},
    "${home_dir}/projects/go/bin" => {},
    "${home_dir}/projects/go/src" => {},
    "${home_dir}/projects/go/src/github.com" => {},
    "${home_dir}/projects/go/src/github.com/malnick" => {},
    "${home_dir}/projects/go/src/github.com/mesosphere" => {},
    "${home_dir}/projects/go/src/github.com/dcos" => {},
  }
  create_resources(file, $go_paths, $file_defaults)
 
}
