# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ingo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias online_marketing='ssh frojas@173.192.43.66'
alias be='bundle exec'
alias bi='http_proxy="http://localhost:3132" bundle install'

export PYTHONPATH=/usr/local/lib/python2.7/site-packages

export PATH="$PATH:/usr/local/Cellar/smlnj/110.75/libexec/bin"

export PATH="/usr/local/bin:$PATH"

SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export PATH="$HOME/.cask/bin:$PATH"
export PATH="$PATH:/Applications/Racket v5.3.6/bin"
export BING_ACCOUNT_ID="bUAy0GFBMdMo1b8fijsp0xZ0VVMt41gz5ykKYf8vvTs"
alias love="/Applications/love.app/Contents/MacOS/love"
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=/usr/local/share/npm/bin:$PATH
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
source $(brew --prefix nvm)/nvm.sh

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=~/.rbenv/shims:$PATH
eval "$(rbenv init -)"
source $HOME/.zshenv

export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
