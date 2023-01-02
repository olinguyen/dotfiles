if status is-interactive
    eval $(/opt/homebrew/bin/brew shellenv)
    source ~/.bash_aliases

    [ -f /opt/homebrew/Cellar/autojump/22.5.3_3/share/autojump/autojump.fish ] && . /opt/homebrew/Cellar/autojump/22.5.3_3/share/autojump/autojump.fish
end
