function t
    set session $argv[1]
    if test -z "$session"
        set session (basename (pwd))
    end

    if tmux has-session -t $session ^/dev/null
        tmux attach -t $session
    else
        tmux new -s $session
    end
end
