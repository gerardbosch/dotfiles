🏰 My main (non-machine/non-environment specific) dotfiles castle –managed by
[Homeshick](https://github.com/andsens/homeshick).

# TL;DR

To **bootstrap** the dotfiles repository just run the following command, which will
bootstrap the dotfiles using Homeshick dotfile manager. It will do the following:
* Clone Homeshick to the right place in your home
* Bootstrap this dotfiles castle

```shell
sh -c "$(curl -fsSL https://gerardbosch.github.io/dotfiles/bootstrap.sh)"
```

You will be prompted for linking the newly downloaded dotfiles and mostly sure
you will be prompted for overwriting some of the files like `.bashrc`, etc. You
can make a backup first if you want or answer no and link them later with
`homeshick link dotfiles`.

This repository uses Git submodules to host its dependencies.

THAT'S ALL! 😎


# What's included

My main personal 'dotfiles' castle, including some shell frameworks, Zsh configs, Zsh plugin
manager, etc.

Dependencies shipped as Git submodules:

* bash-it (A ripoff oh-my-zsh for the Bash shell)

# Why and how?

A few quotes:

>Your home directory is your castle. Don't leave your dotfiles behind.
>
> —Homesick.

>In Unix, configuration files are king.
>
> —HomeSHick.

>version control systems do more than you think
>
>—[Dotbot](https://github.com/anishathalye/dotbot/)
(another dotfile manager)

So, VCS **can do** more than you think, just depending on how you use it.
Submodules are an example of this.

When you organize your dotfiles properly it is easy to put them in a repository.
This can be achieved by symlinking them to `~`, and a dotfile manager can help
here.

# Adding new submodules

You can add to your dotfiles other projects that you want to bring always with
you (like shell frameworks). Use a submodule for that. A convenience script is
provided in `~/bin`; just run:

```shell
add-castle-submod <castle> <URL>
```


* When you add a submodule, submodule's nested submodules (if any) are not
initialized, so they remain empty. If you want/need to populate it:<br>
`git submodule-update-rec --depth=1`     # my own Git alias

# Update submodules

Some of the submodules may update (pull) themselves automatically. But you can
manually update one, or all submodules at once:

```shell
# Pull all submodules from its remotes
git submodule-pull --depth=1   # my Git alias for `git submodule update --init --remote`
git add . && git commit -m "Update all submodules from its remotes."
```
Now, superproject's records store the last commit of each submodule.

* In case the pulling of the submodule introduced a new submodule inside, the
  latter won't be initialized yet, and you will require an additional step after the
  commit:<br>`git submodule-update-rec --depth=1`     # my own Git alias

* *Note: You could be interested in doing the following before* `submodule-update-rec`:
```shell
# (Just in case) sync submodule metadata (URL): Updates all SUBMODULE/.git/config
#   according to .gitmodules (remote URL could change, but not usually happen)
git submodule sync --quiet --recursive
```

# Extra

With Homeshick you can handle multiple castles, this one is for main dotfiles,
but you can have additional castles with machine/environment specific stuff and 
place them in different repositories that could be private, e.g. home or work
specific files.

You can create for example a `dotfiles-local` repository and use Git branches
to segment stuff (branch home, branch work, branch server) for different
settings, or separate dedicated repos.

## Links of interest

* [Homeshick: Shallow symlinking](https://github.com/andsens/homeshick/wiki/Symlinking#shallow-symlinking)

* [Automatically install or update dotfiles when ssh'ing into a remote machine(or: let my dotfiles follow me)](https://github.com/anishathalye/dotbot/wiki/Tips-and-Tricks#automatically-install-or-update-dotfiles-when-sshing-into-a-remote-machine-or-let-my-dotfiles-follow-me)
