# clone & configure dotfiles

git clone --bare https://github.com/mendes13/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

mkdir -p .dotfiles-backup 

dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no


sudo ln -sf ~/.config/docker/daemon.json /etc/docker/daemon.json
sudo systemctl enable docker.service