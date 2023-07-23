# Artem Hodunov’s dotfiles

There are tons of useful things in here:

- The usefulness of [“Oh My ZSH!”](http://ohmyz.sh/) is already built–in.
- [Starship](https://github.com/starship/starship) as a prompt.
- Syntax highlighting of commands while they are typed.

## Installation

Dotfiles are installed by running one of the following commands in your terminal, just copy one of the following commands and execute in the terminal:

Tell Git who you are using these commands:

```sh
git config -f ~/.gitlocal user.email "email@yoursite.com"
git config -f ~/.gitlocal user.name "Name Lastname"
```

Clone dotfiles repo:

```sh
# Clone dotfiles repo
git clone https://github.com/hodunov/dotfiles.git $HOME/.dotfiles

# Go to the dotfiles directory
cd $HOME/.dotfiles

# Install dotfiles
./install
```

### Oh-My-Zsh plugins

These OMZ plugins are included:

- [`git`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git) — git aliases and functions.
- [`npm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/npm) — provides completion as well as adding many useful aliases.
- [`nvm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/nvm) — auto-sourcing `nvm`.
- More are listed in `.zshrc` (it's hard to keep the list updated).

## Resources

Resources that I used to make these dotfiles better:

- [GitHub ❤ ~/](http://dotfiles.github.com/)
- [Denys Dovhan's dotfiles](https://github.com/denysdovhan/dotfiles)
- [Josh Medeski's dotfiles](https://github.com/joshmedeski/dotfiles)

