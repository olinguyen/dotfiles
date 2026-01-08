# Early PATH setup - runs before other conf.d scripts
if status is-interactive
    # Homebrew
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
    set -gx HOMEBREW_REPOSITORY /opt/homebrew
    fish_add_path -gP /opt/homebrew/bin /opt/homebrew/sbin
end
