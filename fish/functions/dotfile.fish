function dotfile --description 'Edit common dotfiles'
    switch $argv[1]
        case fish f
            $EDITOR ~/.config/fish/config.fish
        case abbr a
            $EDITOR ~/.config/fish/conf.d/abbreviations.fish
        case git g
            $EDITOR ~/.gitconfig
        case tmux t
            $EDITOR ~/.tmux.conf
        case claude c
            $EDITOR ~/.claude/CLAUDE.md
        case ghostty gh
            $EDITOR "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
        case atuin at
            $EDITOR ~/.config/atuin/config.toml
        case starship s
            $EDITOR ~/.config/starship.toml
        case '*'
            echo "Usage: dotfile [fish|abbr|git|tmux|claude|ghostty|atuin|starship]"
            echo "       dotfile [f|a|g|t|c|gh|at|s]"
    end
end
