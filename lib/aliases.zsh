#
# Aliases
#

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

_exists() {
  command -v $1 > /dev/null 2>&1
}

# Avoid stupidity with trash-cli:
# https://github.com/sindresorhus/trash-cli
# or use default rm -i
if _exists trash; then
  alias rm='trash'
fi

# Just bcoz clr shorter than clear
alias c="clear"

# Go to the /home/$USER (~) directory and clears window of your terminal
alias q="~ && clear"

# Commands Shortcuts
alias e="$EDITOR"
alias -- +x='chmod +x'
alias x+='chmod +x'

# Run scripts
alias update="source $DOTFILES/scripts/update"

# Quick jump to dotfiles
alias dotfiles="code $DOTFILES"

# Quick reload of zsh environment
alias reload="source $HOME/.zshrc"

# My IP
alias myip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'

# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'

# Download file with original filename
alias get="curl -O -L"

# Use tldr as help util
if _exists tldr; then
  alias help="tldr"
fi

alias git-root='cd $(git rev-parse --show-toplevel)'

if _exists lsd; then
  unalias ls
  alias ls='lsd'
  alias lt='lsd --tree'
fi

# cat with syntax highlighting
# https://github.com/sharkdp/bat
if _exists bat; then
  # Run to list all themes:
  #   bat --list-themes
  export BAT_THEME='base16'
  alias cat='bat'
fi

# Django
alias drs="python manage.py runserver"
alias dj="python manage.py"
alias dt="python manage.py test --verbosity 2"
alias dsp="python manage.py shell_plus --ipython"
alias dm="python manage.py migrate"
alias dmm="python manage.py makemigrations"

# Python
alias python="python3"
alias pip="pip3"
alias py="python"
alias py3="python3"
alias ipython="python3 -m IPython"


# Lazygit
alias lgit="lazygit"
# Lazydocker
alias ldocker="lazydocker"
