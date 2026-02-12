function cf
    if test (count $argv) -eq 0
        echo "Usage: cf <file>"
        return 1
    end

    if test -f $argv[1]
        cat $argv[1] | base64 | tr -d '\n' | awk '{printf "\033]52;c;%s\a", $0}'
    else
        echo "cf: file not found: $argv[1]"
        return 1
    end
end
