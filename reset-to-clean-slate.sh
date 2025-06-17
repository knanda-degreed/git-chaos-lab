#!/bin/bash

echo "🧼 Resetting all lab branches to their clean start commits..."

TEMP_BRANCH=_temp-clean-reset
KNOWN_BRANCHES=(
  main
  lab0-git-flow
  lab1-start
  lab2-start
  lab3-start
  lab4-start
  lab5-start
  lab6-start
  lab7-start
  lab8-start
  lab9-start
  lab-dag-playground
)

BRANCH_TAGS=(
  "main:main-clean"
  "lab0-git-flow:lab0-clean"
  "lab-dag-playground": "lab-dag-playground-clean"
  "lab1-start:lab1-clean"
  "lab2-start:lab2-clean"
  "lab3-start:lab3-clean"
  "lab4-start:lab4-clean"
  "lab5-start:lab5-clean"
  "lab6-start:lab6-clean"
  "lab7-start:lab7-clean"
  "lab8-start:lab8-clean"
  "lab9-start:lab9-clean"
  "lab-dag-playground:lab-dag-playground-clean"
)

# Fetch tags and latest info from origin
git fetch origin --tags

# Create and switch to a temporary branch to avoid issues with checked-out branches
git checkout -b "$TEMP_BRANCH"

# Delete all local branches that aren't in KNOWN_BRANCHES
for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
  if [[ ! " ${KNOWN_BRANCHES[@]} " =~ " ${branch} " ]]; then
    echo "🗑️ Deleting unexpected local branch: $branch"
    git branch -D "$branch"
  fi
done

# Reset each known branch to its corresponding clean tag
for entry in "${BRANCH_TAGS[@]}"
do
  IFS=":" read -r branch tag <<< "$entry"
  if git rev-parse "$tag" >/dev/null 2>&1; then
    echo "🔁 Resetting $branch to $tag..."
    git branch -f "$branch" "$tag"
    git push -f origin "$branch"
  else
    echo "⚠️ Tag $tag not found. Skipping reset of $branch."
  fi
done

# Delete remote branches that are not in the known list
REMOTE_BRANCHES=$(git ls-remote --heads origin | awk '{print $2}' | sed 's_refs/heads/__')
for branch in $REMOTE_BRANCHES; do
  if [[ ! " ${KNOWN_BRANCHES[@]} " =~ " ${branch} " ]]; then
    echo "🗑️ Deleting unexpected remote branch: $branch"
    git push origin --delete "$branch"
  fi
done

# Cleanup
git checkout main
git branch -D "$TEMP_BRANCH"

echo "✅ All known lab branches have been reset and stray branches removed."