function fish_title
    if set -q argv[1]
        echo (string split ' ' -- $argv[1])[1]
    else
        echo (basename $PWD)
    end
end
