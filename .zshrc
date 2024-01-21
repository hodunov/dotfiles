# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# ~/.zshrc
# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Pyenv
export PATH="$(pyenv root)/shims:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

# Add custom bin to $PATH
_extend_path "$HOME/.local/bin"
_extend_path "$DOTFILES/bin"
_extend_path "$HOME/.npm-global/bin"
_extend_path "$HOME/.bun/bin"
_extend_path "$HOME/.config/bin:$PATH"

# Better formatting for time command
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
ZSH_DISABLE_COMPFIX=true

# Autoload node version when changing cwd
zstyle ':omz:plugins:nvm' autoload true

# Use passphase from macOS keychain
if [[ "$OSTYPE" == "darwin"* ]]; then
  zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain
fi

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"

    # Ohmyzsh base library
    zgenom ohmyzsh

    # Oh-My-Zsh plugins
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/history-substring-search
    zgenom ohmyzsh plugins/sudo
    zgenom ohmyzsh plugins/command-not-found
    zgenom ohmyzsh plugins/npm
    zgenom ohmyzsh plugins/yarn
    zgenom ohmyzsh plugins/nvm
    zgenom ohmyzsh plugins/extract
    zgenom ohmyzsh plugins/ssh-agent
    zgenom ohmyzsh plugins/gpg-agent
    zgenom ohmyzsh plugins/macos
    zgenom ohmyzsh plugins/vscode
    zgenom ohmyzsh plugins/gh
    zgenom ohmyzsh plugins/common-aliases
    zgenom ohmyzsh plugins/docker
    zgenom ohmyzsh plugins/pyenv
    zgenom ohmyzsh plugins/pipenv
    zgenom ohmyzsh plugins/pip
    zgenom ohmyzsh plugins/python
    zgenom ohmyzsh plugins/virtualenv

    # Custom plugins
    zgenom load chriskempson/base16-shell
    zgenom load djui/alias-tips
    zgenom load agkozak/zsh-z
    zgenom load marzocchi/zsh-notify
    zgenom load hlissner/zsh-autopair
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    # zgenom load MichaelAquilina/zsh-autoswitch-virtualenv

    # Files
    zgenom load $DOTFILES/lib

    # just load the completions
    zgenom ohmyzsh --completion plugins/docker-compose

    # Install ohmyzsh osx plugin if on macOS
    [[ "$(uname -s)" = Darwin ]] && zgenom ohmyzsh plugins/macos

    # add binaries
    zgenom bin tj/git-extras

    # completions
    zgenom load zsh-users/zsh-completions

    # save all to init script
    zgenom save

    # Compile your zsh files
    zgenom compile "$HOME/.zshrc"
fi

# ______________________________________________________________________________
# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fuzzy finder bindings
if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
fi

# Pipenv
eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# homebrew
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="~/.config/bin:$PATH"

[[ "$TERM_PROGRAM" == "CodeEditApp_Terminal" ]] && . "/Applications/CodeEdit.app/Contents/Resources/codeedit_shell_integration.zsh"

# # Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
