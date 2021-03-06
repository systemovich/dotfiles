#------------------------------------------------------------------------------
# Aliases
#------------------------------------------------------------------------------

alias artisan=./artisan
alias phinx='./vendor/bin/phinx'
alias xdebug-on='sudo phpenmod -s cli xdebug'
alias xdebug-off='sudo phpdismod -s cli xdebug'

#------------------------------------------------------------------------------
# Antigen
#------------------------------------------------------------------------------

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle tmux

# Bundles from ZSH Users Organisation on GitHub 
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Tell antigen that you're done.
antigen apply
