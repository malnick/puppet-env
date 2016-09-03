class env::gitrepos($home_dir){
  $repo_defaults = {
    'ensure'    => 'present',
    'provider'  => 'git',
  }

  $repos = {
    "${home_dir}/projects/mesosphere/dcos"            => {'source' => 'git@github.com:dcos/dcos'},
    "${home_dir}/projects/mesosphere/dcos-docker"     => {'source' => 'git@github.com:dcos/dcos-docker'},
    "${home_dir}/projects/mesosphere/dcos-enterprise" => {'source' => 'git@github.com:mesosphere/dcos-enterprise'},
    "${home_dir}/projects/mesosphere/adminrouter"     => {'source' => 'git@github.com:mesosphere/adminrouter'},

    "${home_dir}/projects/go/src/github.com/dcos/dcos-signal"     => {'source' => 'git@github.com:dcos/dcos-signal'},
    "${home_dir}/projects/go/src/github.com/dcos/3dt"             => {'source' => 'git@github.com:dcos/3dt'},
    "${home_dir}/projects/go/src/github.com/malnick/logasaurus"   => {'source' => 'git@github.com:malnick/logasaurus'},

    "${home_dir}/projects/technoblogic" => {'source' => 'git@github.com:malnick/technoblogic'},
  }

  create_resources(vcsrepo, $repos, $repo_defaults)
}
