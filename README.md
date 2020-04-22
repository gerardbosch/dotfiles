🏰 My main (non-machine/non-environment specific) dotfiles castle –managed by
[Homeshick](https://github.com/andsens/homeshick).

# TL;DR

To **bootstrap** the dotfiles repository just run the following command, which will
bootstrap the dotfiles using Homeshick dotfile manager. It will do the following:
* Clone Homeshick to the right place in your home
* Bootstrap this dotfiles castle

```
sh -c "$(curl github.io/gerardbosch/dotfiles/bootstrap.sh)"
```

You will be prompted for linking the newly downloaded dotfiles and mostly sure
you will be prompted for overwriting some of the files like `.bashrc`, etc. You
can make a backup first if you want or answer no and link them later with
`homeshick link dotfiles`.

This repository uses Git submodules to host its dependencies (oh-my-zsh,
bash-it,...)

THAT'S ALL! 😎


# What's included

My main personal 'dotfiles' castle, including some shell frameworks like
Oh-my-zsh.

Dependencies shipped as Git submodules:

* oh-my-zsh (Awesome Zsh community framework)
* Powerlevel-10k (p10k - A popular theme for Zsh)
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

You can add to your dotfiles other projects that you want bring always with you
(like shell frameworks), use a submodule for that:

```
homeshick cd dotfiles
git submodule add --depth=1 URL
git config -f .gitmodules submodule.SUBMODULE_NAME.ignore all
git config -f .gitmodules submodule.SUBMODULE_NAME.update merge
cd ./home && ln -s ../SUBMODULE_NAME LINK_NAME
```

# Update submodules

Some of the submodules like `oh-my-zsh` may update themselves automatically. But 
you can manually update one, or all submodules at once:

```
# A good idea is to update the dotfiles castle first:
homeshick pull dotfiles

# (Just in case) sync submodule metadata (URL): Updates all SUBMODULE/.git/config
#   according to .gitmodules (remote URL could change, but not usually happen)
git submodule sync --quiet --recursive

# Pull all submodules from its remotes
git submodule update --init --remote
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
