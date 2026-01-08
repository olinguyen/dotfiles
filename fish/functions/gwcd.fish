# Navigate to a worktree or back to base directory
function gwcd --description "Navigate to a worktree branch or back to base directory"
  if test -z "$argv[1]"
    # No branch given, go back to base directory
    set -l cwd (pwd)
    set -l worktree (basename "$cwd")

    # split on first `--`
    set -l parts (string split --max=1 -- '--' "$worktree")
    set -l root $parts[1]

    # Check if we're in a worktree directory
    if test "$root" != "$worktree"
      cd "../$root"
    else
      echo "Already in base directory or not in a worktree"
    end
  else
    # Branch given, navigate to that worktree
    set -l branch $argv[1]
    set -l cwd (pwd)
    set -l worktree (basename "$cwd")

    # Get the base name
    set -l parts (string split --max=1 -- '--' "$worktree")
    set -l base $parts[1]

    set -l target "../$base--$branch"

    if test -d "$target"
      cd "$target"
    else
      echo "Worktree '$target' not found"
      return 1
    end
  end
end
