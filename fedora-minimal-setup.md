# Minimal fedora installation guide

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

That's the initial steps. Now I'm gonna run through what I personally installed to set up my system.

## Set up tiling window manager
