function compress --description 'Create .tar.gz archive'
    if test (count $argv) -lt 2
        echo "Usage: compress <archive.tar.gz> <file_or_dir>"
        return 1
    end

    tar -cvzf $argv[1] $argv[2]
end
