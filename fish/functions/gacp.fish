function gacp --description 'Add, commit, push in one go'
    if test (count $argv) -eq 0
        echo "Usage: gacp <commit message>"
        return 1
    end
    git add -u
    and git commit -m "$argv"
    and git push
end
