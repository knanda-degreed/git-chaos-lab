#!/bin/bash

set -e

echo "🛠️ Creating lab5-start branch with a working script and 110 commits..."

git checkout -b lab5-start

# Step 1: Add working script
echo "echo 'GOOD'" > script.sh
chmod +x script.sh
git add script.sh
git commit -m "Initial good script"

# Step 2: Add 109 dummy commits
for i in $(seq 1 109); do
  echo "Progress $i" >> progress.txt
  git add progress.txt
  git commit -m "Checkpoint $i"
done

# Step 3: Introduce the bug in commit 110
echo "echo 'BAD'" > script.sh
git add script.sh
git commit -m "Bug introduced"

echo "✅ Done. You now have 110+ commits on lab5-start ending with a broken script."