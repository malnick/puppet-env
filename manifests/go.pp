class env::go ($home_dir){
	class {'golang':
		base_dir    	=> "${home_dir}/projects/go", 
		from_repo   	=> true,
		repo_version 	=> 'go1.7',
		goroot      	=> '$GOPATH/bin:/usr/local/go/bin:$PATH',
		workdir     	=> "${home_dir}/projects/",
	} 

  $go_paths = {
    "${home_dir}/projects/go" => {
      "ensure" => "directory",
      "owner"  => "malnick",
      "group"  => "malnick",
    },
    "${home_dir}/projects/go/bin" => {
      "ensure" => "directory",
      "owner"  => "malnick",
      "group"  => "malnick",
    },
    "${home_dir}/projects/go/src" => {
      "ensure" => "directory",
      "owner"  => "malnick",
      "group"  => "malnick",
    }
  }
  create_resources(file, $go_paths)
 
}
