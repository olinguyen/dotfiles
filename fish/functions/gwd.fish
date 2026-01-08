# Remove worktree and branch from within active worktree directory.
function gwd --description "Remove the current worktree and its associated branch"
  read -l -P "Remove worktree and branch? [y/N] " confirm
  or return  # Exit if user cancelled with Ctrl+C or Ctrl+D

  if string match -qi "y" $confirm
    set -l cwd (pwd)
    set -l worktree (basename "$cwd")

    # split on first `--`
    set -l parts (string split --max=1 -- '--' "$worktree")
    set -l root $parts[1]
    set -l branch $parts[2]

    # Protect against accidentally nuking a non-worktree directory
    if test "$root" != "$worktree"
      cd "../$root"

      git worktree remove "$worktree" --force
      git branch -D "$branch"
    end
  end
end
