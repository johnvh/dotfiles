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

I recommend using [stow's `--no-folding` option][stow-tree-folding] when
installing the packages bash, binstuff and git. I would recommend letting
tree-folding do it's thing when installing the vim package, or else you'll end
up with each file in every plugin bundle symlinked, instead of one symlink for
the plugin directory.

[stow]: https://www.gnu.org/software/stow/
[stow-tree-folding]: https://www.gnu.org/software/stow/manual/stow.html#Installing-Packages
[homebrew]: http://brew.sh/
