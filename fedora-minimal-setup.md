# Minimal fedora installation guide
Fedora 36

## Download and initial installation
Download the fedora network installer [Fedora Server](https://alt.fedoraproject.org/).
Boot the iso and run through the installation program. In the net installer you can select which packages to include in your installation.
I ticked the box for "Fedora Custom Operating System" or similar instead of the default value "Fedora Server". This will install the most bare bones version of fedora without a graphics compositor or anything which let's you pick your own set up from scratch.
I also included the ~"Standard utils package" to include some useful utils to the terminal by default.

After the installation process you get greeted with the default shell in fedora. Run `dnf up` to update your system.

There should be about 500-600 packages installed, check with:
`rpm -qa | wc -l`

There should be about 100-150 background processes, check with:
`ps aux | wc -l`

Install git with `dnf in git-all`. Set up ssh key with github etc.
Configure git:
`git config --global user.name "bob"`
`git config --global user.email "example@email.com"`
You may need to restart the command line for the changes to take place. Right now you are in a bare bones shell called tty.

Some helpful commands in tty:
`reset`
`logout`
`WIN+right/left arrow` to change tty session

That's the initial steps. Now I'm gonna run through what I personally installed to set up my system.

## Set up tiling window manager
Download RiverWM with `sudo dnf in river`. You can follow this guide for a more in-depth set up: [Link](https://leon_plickat.srht.site/blog/setting-up-river-010/article.html)

When you have downloaded river you can run it manually in tty with the command `river`. At startup river reads from a config file at ~/.config/river/init which will be the starting point to get river to behave how you'd like. However, the default behaviour is just an empty soul-less screen. Let's change that.



# Second edition

## Download and initial installation
Download the fedora network installer [Fedora Server](https://alt.fedoraproject.org/).
Boot the iso and run through the installation program. In the net installer you can select which packages to include in your installation.
I ticked the box for "Minimal installation" instead of the default value "Fedora Server". This will install a minimal version of fedora where you can pick your software on your own.
I also included the ~"Standard utils package" to include some useful utils to the terminal by default.

After the installation process you get greeted with the default shell in fedora. Run `dnf up` to update your system.

There should be about 500-600 packages installed, check with:
`rpm -qa | wc -l`

There should be about 100-150 background processes, check with:
`ps aux | wc -l`

Download X server and compositor, background manager, text editor, web browser:
`sudo dnf in @base-x xorg-x11-xinit nitrogen vim firefox picom`

## Install Window manager

`sudo dnf in sway`

# Third edition

`sudo dnf in --setopt install_weak_deps=false weston htop`

Now you can run a sluggish framebuffer GUI by typing
`weston-launch`

Kill that process by opening a terminal and run
`pkill weston`

Install modern accelerated drivers
`dnf install --setopt install_weak_deps=false mesa-dri-drivers`

Run weston with drivers
`weston-launch -- -B drm-backend.so`

Install sway

`dnf install --setopt install_weak_deps=false sway`

`mkdir ~/.config/sway`

`cp /etc/sway/config ~/.config/sway/config`

now you can first run `weston` then run `sway`

Install programs:
`sudo dnf -y in fira-code-fonts fontawesome-fonts powerline-fonts mako pavucontrol ranger rofi swaylock waybar wl-clipboard grim slurp alacritty tmux`

Other helpful programs: mpv, mpd, mpc

Add your dotfiles for `vim, bash, tmux, sway`, etc.
Swaywm dotfile filepath is located at: /etc/sway/config

Change default editor to vim:
`which vim`
Copy the path and set the global to that path.
`export EDITOR="/usr/bin/vim"`

For more docs about sway, `man 1 sway`
## Resources

https://bcksp.blogspot.com/2017/09/making-minimal-graphical-operating.html
https://computingforgeeks.com/setup-sway-tiling-window-manager-on-fedora-with-waybar/

[rxvt-unicode setup](https://www.youtube.com/watch?v=_kjbj-Ez1vU)
[i3wm setup](https://www.youtube.com/watch?v=j1I63wGcvU4&list=PL5ze0DjYv5DbCv9vNEzFmP6sU7ZmkGzcf)


# Fedora minimal with endeavouros i3 configs
Install Fedora with the netinstaller.
Pick fedora minimal and standard packages.
After installing and rebooting you are presented with the tty. Login, then edit your dnf settings with `sudoedit /etc/dnf/dnf.conf`

This is what's in my dnf.conf file:
 [main]
  1 gpgcheck=1
  2 installonly_limit=3
  3 clean_requirements_on_remove=True
  4 best=False
  5 skip_if_unavailable=True
  6 fastestmirror=True
  7 max_parallel_downloads=10
  8 defaultyes=True
  9 keepcache=True

Now install some core programs to get started.
`sudo dnf in -y vim tmux`

Set your default editor in your env files with the output of `which vim`, in my case it is `export EDITOR='/usr/bin/vim`

Install git with `dnf in git-all`. Set up ssh key with github etc.
Configure git:
`git config --global user.name "Joel Plumppu"`
`git config --global user.email "16489683+paccao@users.noreply.github.com"`
You may need to restart the command line for the changes to take place. Right now you are in a bare bones shell called tty.

Generate a new SSH-key. If you are using macOS or Linux, you may need to update your SSH client or install a new SSH client prior to generating a new SSH key. For more information, see ["Error: Unknown key type."](https://docs.github.com/en/authentication/troubleshooting-ssh/error-unknown-key-type).
`ssh-keygen -t ed25519 -C "16489683+paccao@users.noreply.github.com"`
Choose a location then enter a safe password. I recommend that you generate one using a password manager and saving it there.

Add the locally generated key to your ssh-agent
`eval $(ssh-agent -s)`
> Agent pid 96590

`ssh-add ~/.ssh/id_ed25519`
Now add that key to your GitHub account. [Link to GitHub settings](https://github.com/settings/keys).


Clone your dotfiles.
`git clone git@github.com:paccao/dotfiles_.git`
`git clone git@github.com:endeavouros-team/endeavouros-i3wm-setup.git`

Endeavour OS i3wm [setup guide](https://github.dev/endeavouros-team/endeavouros-i3wm-setup).