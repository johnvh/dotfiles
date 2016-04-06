# Johnvh's dotfiles

Dotfiles!

Structured as packages that are installable using [GNU Stow][stow]. Stow is
installable on Mac via [homebrew][homebrew] - `brew install stow`.

After stow is installed, install any of the packages (top level directories are
packages) by passing the dir name to stow:

```
# make sure target directory is correct!
stow --target ~ vim git
```

Or run the install script `install.sh` for preconfigured options:

```
# sets target dir to ~, includes ignore patterns, etc.
./install.sh vim git

# use -n for dry run
./install.sh -n vim git
```

[stow]: https://www.gnu.org/software/stow/
[homebrew]: http://brew.sh/
