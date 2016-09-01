class env::go ($home_dir){
	class {'golang':
		base_dir    	=> "${home_dir}/projects/go", 
		from_repo   	=> true,
		repo_version 	=> 'go1.7',
		goroot      	=> '$GOPATH/bin:/usr/local/go/bin:$PATH',
		workdir     	=> "${home_dir}/projects/",
	} 
}
