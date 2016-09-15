class env::gitrepos($home_dir){
  $repo_defaults = {
    'ensure'    => 'present',
    'provider'  => 'git',
    'user'      => 'malnick',
  }

  $repos = {
    # Project Repos
    "${home_dir}/projects/mesosphere/dcos"            => {'source' => 'git@github.com:dcos/dcos'},
    "${home_dir}/projects/mesosphere/dcos-docker"     => {'source' => 'git@github.com:dcos/dcos-docker'},
    "${home_dir}/projects/mesosphere/dcos-enterprise" => {'source' => 'git@github.com:mesosphere/dcos-enterprise'},
    "${home_dir}/projects/mesosphere/adminrouter"     => {'source' => 'git@github.com:mesosphere/adminrouter'},

    # Mesosphere Golang Repos
    "${home_dir}/projects/go/src/github.com/dcos/dcos-signal"                       => {'source' => 'git@github.com:dcos/dcos-signal'},
    "${home_dir}/projects/go/src/github.com/mesosphere/dcos-signal-enterprise"      => {'source' => 'git@github.com:mesosphere/dcos-signal-enterprise'},
    "${home_dir}/projects/go/src/github.com/dcos/3dt"                               => {'source' => 'git@github.com:dcos/3dt'},
    
    # Personal Golang Repos
    "${home_dir}/projects/go/src/github.com/malnick/logasaurus"   => {'source' => 'git@github.com:malnick/logasaurus'},
    "${home_dir}/projects/go/src/github.com/malnick/cryptorious"  => {'source' => 'git@github.com:malnick/cryptorious'},
    "${home_dir}/projects/go/src/github.com/malnick/goss"         => {'source' => 'git@github.com:malnick/goss'},
    "${home_dir}/projects/go/src/github.com/gorilla/mux"          => {'source' => 'git@github.com:gorilla/mux'},
    "${home_dir}/projects/go/src/github.com/urfave/cli"           => {'source' => 'git@github.com:urfave/cli'},
    "${home_dir}/projects/go/src/github.com/github/hub"           => {'source' => 'git@github.com:github/hub'},

    # Personal Projects
    "${home_dir}/projects/technoblogic"       => {'source' => 'git@github.com:malnick/technoblogic'},
    "${home_dir}/projects/zsh-gitster-theme"  => {'source' => 'git@github.com:malnick/zsh-gitster-theme'},
  }

  create_resources(vcsrepo, $repos, $repo_defaults)
  
  # Move zshell theme into place
  file { "${home_dir}/.oh-my-zsh/themes/gitster.zsh-theme":
    ensure  => link,
    target  => "${home_dir}/projects/zsh-gitster-theme/gitster.zsh-theme",
    owner   => 'malnick',
  }

  file { "/root/.oh-my-zsh/themes/gitster.zsh-theme":
    ensure  => link,
    target  => "${home_dir}/projects/zsh-gitster-theme/gitster.zsh-theme",
  }
}
