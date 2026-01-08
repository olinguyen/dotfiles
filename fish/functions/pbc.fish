function pbc --description 'Copy file contents to clipboard'
    if test -f $argv[1]
        pbcopy < $argv[1]
        echo "Copied $argv[1] to clipboard"
    else
        echo "File not found: $argv[1]"
    end
end
