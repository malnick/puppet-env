class env::gitrepos($home_dir){
  $repo_defaults = {
    'ensure'    => 'present',
    'provider'  => 'git',
    'user'      => 'ubuntu',
  }

  $repos = {
    "${home_dir}/projects/go/src/github.com/malnick/logasaurus"   => {'source' => 'git@github.com:malnick/logasaurus'},
    "${home_dir}/projects/go/src/github.com/malnick/cryptorious"  => {'source' => 'git@github.com:malnick/cryptorious'},
    "${home_dir}/projects/go/src/github.com/malnick/goss"         => {'source' => 'git@github.com:malnick/goss'},
    "${home_dir}/projects/go/src/github.com/gorilla/mux"          => {'source' => 'git@github.com:gorilla/mux'},
    "${home_dir}/projects/go/src/github.com/urfave/cli"           => {'source' => 'git@github.com:urfave/cli'},
    "${home_dir}/projects/go/src/github.com/github/hub"           => {'source' => 'git@github.com:github/hub'},

    # Misc projects
    "${home_dir}/projects/linux-kernel-utilities"        => {'source' => 'git@github.com:mtompkins/linux-kernel-utilities'},

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
