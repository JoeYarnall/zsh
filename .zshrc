# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="babun"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:/cygdrive/c/Program\ Files/Sublime\ Text\ 3
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='subl'
  export VISUAL='subl'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Repo base directory
export BASE="/cygdrive/c/Users/Joe-Goldhawk/Repos"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Extra git alaises to make working with multiple repos easier
alias gll='for d in $BASE/*/; do (cd "$d" && gl) &; done; wait;'
alias ggpnpp='for d in $BASE/*/; do (cd "$d" && ggpnp) &; done; wait;'
alias gstt='for d in $BASE/*/; do (cd "$d" && echo "\033[34m--- "$d" ---\033[0m" && gst && echo ""); done'
alias gbaa='for d in $BASE/*/; do (cd "$d" && echo "\033[34m--- "$d" ---\033[0m" && gba && echo ""); done'
alias gtidy='for d in $BASE/*/; do (cd "$d" && gbda && gfp && gbdar) &; done; wait;'

# List all things in the stash
alias gstl='git stash list'

function gcbb { for d in $BASE/*/; do (cd "$d" && gco development && gcb $1 && gp -u) &; done; wait; }

# Delete branches which are merged into development locally ignoring development and master branches
alias gbda='git branch --merged development | grep -vE "^\*?\s*(development|master)$" | xargs -n 1 git branch -d'

# Delete branches which are merged into development remotely ignoring development and master branches
alias gbdar='git branch -r --merged origin/development | grep -vE "origin/(master|development)$" | perl -npe "s%^\s*origin/%%" | xargs -n 1 git push origin --delete'

# Removes branches that have been deleted in the origin remote repository
alias gfp='git fetch -p origin'

# Short hand for clear
alias c='clear'

# Change directory to the repos folder when done
cd $BASE
