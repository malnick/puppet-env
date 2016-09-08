class env::dotfiles($home_dir){
  vcsrepo { "${home_dir}/personal/dotfiles":
    ensure   => latest,
    provider => 'git',
    source   => 'git@github.com:malnick/dotfiles.git',
    user     => 'malnick',
    require  => User['malnick'],
  }

  $dotfile_defaults = {
    'ensure' => 'link',
    'force'  => true,
    'owner'  => 'malnick',
    require  => [User['malnick'], Vcsrepo["${home_dir}/personal/dotfiles"]],
  }

  $dotfiles = {
    "${home_dir}/.vimrc"        => {'target' => "${home_dir}/personal/dotfiles/vimrc"}, 
    "${home_dir}/.tmux.conf"    => {'target' => "${home_dir}/personal/dotfiles/tmux.conf"}, 
    "${home_dir}/.aws"          => {'target' => "${home_dir}/personal/dotfiles/aws"}, 
    "${home_dir}/.zshrc"        => {'target'  => "${home_dir}/personal/dotfiles/zshrc"}, 
    "${home_dir}/.loga"         => {'target'  => "${home_dir}/personal/dotfiles/loga"}, 
    "${home_dir}/.cryptorious"  => {'target'  => "${home_dir}/personal/dotfiles/cryptorious"}, 
    "${home_dir}/.gitconfig"    => {'target'  => "${home_dir}/personal/dotfiles/gitconfig"}, 
    "${home_dir}/.gconf"        => {'target'  => "${home_dir}/personal/dotfiles/gconf"}, 
  }

  create_resources(file, $dotfiles, $dotfile_defaults)

  $root_defaults = {
    'ensure' => 'link',
    'force'  => true,
    'owner'  => 'root',
    require  => Vcsrepo["${home_dir}/personal/dotfiles"],
  }

  $root_dotfiles = {
    "/root/.vimrc"        => {'target' => "${home_dir}/personal/dotfiles/vimrc"}, 
    "/root/.tmux.conf"    => {'target' => "${home_dir}/personal/dotfiles/tmux.conf"}, 
    "/root/.aws"          => {'target' => "${home_dir}/personal/dotfiles/aws"}, 
    "/root/.zshrc"        => {'target'  => "${home_dir}/personal/dotfiles/zshrc"}, 
    "/root/.loga"         => {'target'  => "${home_dir}/personal/dotfiles/loga"}, 
    "/root/.cryptorious"  => {'target'  => "${home_dir}/personal/dotfiles/cryptorious"}, 
    "/root/.gitconfig"    => {'target'  => "${home_dir}/personal/dotfiles/gitconfig"}, 
  }

  create_resources(file, $root_dotfiles, $root_defaults)
}
