set -o vi

if tmux list-sessions | grep $USER > /dev/null; then 
    tmux attach -t $USER
else
    tmux new -s $USER
fi


export http_proxy=http://proxycpt.media24.com:80
export https_proxy=http://proxycpt.media24.com:80
export no_proxy="127.0.0.0/8,localhost,*.local,spree.dev,*.dev"

source $HOME/.bash_profile
