class env::dotfiles($home_dir){
  vcsrepo { "${home_dir}/personal/dotfiles":
    ensure   => latest,
    provider => git,
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
    "${home_dir}/.vimrc"      => {'target' => "${home_dir}/personal/dotfiles/vimrc"}, 
    "${home_dir}/.tmux.conf"  => {'target' => "${home_dir}/personal/dotfiles/tmux.conf"}, 
    "${home_dir}/.aws"        => {'target' => "${home_dir}/personal/dotfiles/aws"}, 
    "${home_dir}/.zshrc"      => {'target'  => "${home_dir}/personal/dotfiles/zshrc"}, 
  }

  create_resources(file, $dotfiles, $dotfile_defaults)

}
