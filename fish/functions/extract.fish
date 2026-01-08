function extract --description 'Extract common archive formats'
    if test (count $argv) -eq 0
        echo "Usage: extract <file>"
        return 1
    end

    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2' '*.tar.bz'
                tar xvjf $argv[1]
            case '*.tar.gz'
                tar xvzf $argv[1]
            case '*.tar.xz'
                tar xvJf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xvf $argv[1]
            case '*.tbz2'
                tar xvjf $argv[1]
            case '*.tgz'
                tar xvzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*.xz'
                unxz $argv[1]
            case '*'
                echo "don't know how to extract '$argv[1]'..."
                return 1
        end
    else
        echo "'$argv[1]' is not a valid file!"
        return 1
    end
end
