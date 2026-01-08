# Create a new worktree and branch from within current git directory.
function gwa --description "Create a new git worktree with a branch in a sibling directory"
  if test -z "$argv[1]"
    echo "Usage: gwa [branch name]"
    return 1
  end

  set -l branch $argv[1]
  set -l base (basename "$PWD")
  set -l path "../$base--$branch"

  git worktree add -b "$branch" "$path"
  mise trust "$path"
  cd "$path"
end
