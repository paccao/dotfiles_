# dotfiles_
Some of my configs and more

## Install zsh, ohmyzsh on windows

Download git

### Download ZSH

Download the latest MSYS2 zsh package from the MSYS2 package repository.

The file will be named something along the lines of zsh-#.#-#-x86_64.pkg.tar.zst

To unpack it I used [WSL Ubuntu](https://learn.microsoft.com/en-us/windows/wsl/install) where I installed `zstd` from apt.

```shell
cd ~/Downloads
unzstd zsh-#.#-#-x86_64.pkg.tar.zst

mkdir zsh-out
tar -xf zsh-#.#-#-x86_64.pkg.tar -C zsh-out
```

Copy the `etc` and `usr` directories from `zsh-out` to wherever you want to store the binaries. 

I added them to my git bash for windows directory **without** overwriting any files

### Set up Windows Terminal

Open Windows terminal, which you can install with chocolatey

Open settings, then the json settings file.

Add a profile to your Windows Terminal for zsh, specify the path, tab title and any icon you like to use

Set it as the default profile

### Set up oh-my-ZSH and plugins

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Copy the `.zshrc` and `.bash_aliases` from this repo to your home directory

Remember that zsh gets slower for each plugin you set up in you `.zshrc`

The plugins binaries are stored in `~/.oh-my-zsh/custom/plugins`

## Resources
How to install the vim plugin YouCompleteMe: [Link](https://ethans.me/posts/2018-09-01-installing-vim-with-youcompleteme-plugin-to-enable-autocomplete/)
