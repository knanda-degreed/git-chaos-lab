#!/bin/bash

echo "🧼 Resetting all lab branches to their clean start commits..."

TEMP_BRANCH=_temp-clean-reset
BRANCH_TAGS=(
  "main:main-clean"
  "lab0-git-flow:lab0-clean"
  "lab1-start:lab1-clean"
  "lab2-start:lab2-clean"
  "lab3-start:lab3-clean"
  "lab4-start:lab4-clean"
  "lab5-start:lab5-clean"
  "lab6-start:lab6-clean"
  "lab7-start:lab7-clean"
  "lab8-start:lab8-clean" 
  "lab9-start:lab9-clean"
)

# Fetch tags and latest info from origin
git fetch origin --tags

# Create and switch to a temporary branch to avoid conflicts with currently checked-out branch
git checkout -b "$TEMP_BRANCH"

# Reset each branch to its corresponding tag and push forcefully
for entry in "${BRANCH_TAGS[@]}"
do
  IFS=":" read -r branch tag <<< "$entry"
  echo "🔁 Resetting $branch to $tag..."
  git branch -f "$branch" "$tag"
  git push -f origin "$branch"
done

# Cleanup: return to main and remove temp branch
git checkout main
git branch -D "$TEMP_BRANCH"

echo "✅ All branches have been reset to their clean snapshot tags."