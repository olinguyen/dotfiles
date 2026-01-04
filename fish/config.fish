# --- Env & session basics -----------------------------------------------------
# Use exported globals (-gx) so they apply to this session without permanently
# writing fish "universal" variables (which can be hard to undo).
# set -gx COLORTERM truecolor # 24-bit color for apps that honor it
set -gx EDITOR nvim # or vim, nano, code -w, etc.
set -gx VISUAL $EDITOR

# --- Greeting & misc ----------------------------------------------------------
set -g fish_greeting

# --- PATH additions -----------------------------------------------------------
fish_add_path $HOME/.atuin/bin
fish_add_path -gaP ~/.toolbox/bin ~/bin ~/.local/bin ~/.claude/local

# pnpm
set -gx PNPM_HOME $HOME/Library/pnpm
fish_add_path -gaP $PNPM_HOME

# bun
set -gx BUN_INSTALL "$HOME/Library/Application Support/reflex/bun"
fish_add_path -gaP "$BUN_INSTALL/bin"

if status is-interactive
    # worktrunk shell integration
    command wt config shell init fish | source

    source ~/.bash_aliases

    # Directory jumping
    zoxide init fish | source

    # AWS config
    set -gx AWS_SDK_LOAD_CONFIG 1
    set -gx AWS_REGION us-west-2
    set -gx AWS_DEFAULT_REGION us-west-2

    set -gx BAT_THEME Nord

    # Claude Code
    set -gx DISABLE_TELEMETRY 1
    set -gx DISABLE_ERROR_REPORTING 1
    set -gx DISABLE_BUG_COMMAND 1
    set -gx CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC 1
    set -gx CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR 1

    # Init starship
    starship init fish | source

    # Tokyo Night (Ghostty tuned)
    set -gx FZF_DEFAULT_OPTS '
      --color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7
      --color=fg+:#c0caf5,bg+:#24283b,hl+:#7dcfff
      --color=info:#7aa2f7,prompt:#7dcfff,pointer:#ff9e64,marker:#9ece6a,spinner:#bb9af7
      --border=rounded
      --layout=reverse
      --height=80%
    '

    # Shell history with atuin
    atuin init fish | source

    # Runtime management
    mise activate fish | source
end
