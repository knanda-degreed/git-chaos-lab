
📘 Repository: git-chaos-lab

🔥 Description:

A hands-on Git workshop built around real-world conflict nightmares.Learn to tame rebase, revert, cherry-pick, and rerere through chaos-driven labs based on actual engineering war stories.

This repo is designed for live workshops, self-paced practice, and team onboarding.

Overview

A hands-on Git workshop exploring real-world problems, common mistakes, and practical resolutions. Based on live scenarios faced by engineers.

🧪 What You'll Practice:

Reverting merge commits with multiple parents

Resolving rebase conflicts and recovering from history rewrites

Cherry-picking fixes (and their dependencies!)

Using git reflog, git rerere, and git worktree like a pro

Cleaning up messy commit histories

🚀 How to Use:

Click the GitPod link in each lab or use your local Git setup.

Follow the README in each lab*/ directory.

Break things. Fix things. Rinse and repeat.

🧰 Audience:

Engineers who’ve suffered enough Git trauma to want revenge

Teams adopting Git best practices in complex environments (e.g. staging/, release/, prod/)

Anyone who's ever typed git reset --hard and held their breath

Lab 1: The Premature Merge

Scenario:

FE and BE engineers collaborate. FE's branch is merged prematurely before review. The FE lead reviews post-merge and not only suggests changes but directly merges some of their own into main, before the FE engineer has a chance to explain. Now the codebase contains a mix of desirable and undesirable changes from the FE lead, making the revert of the original merge commit more complex.

Objective:

Learn to revert a merge commit cleanly using the correct parent and selectively retain desired changes.

Commands:

git log --oneline  # Find the merge commit
git revert -m 1 <merge-commit-hash>
# Optional: cherry-pick or re-apply desired changes afterward

Lab 2: Rebase Gone Rogue

Scenario:

Post-merge, team decides to undo changes. Rebase accidentally brings in unrelated commits.

Objective:

Use reflog, reset, and careful rebasing to fix history.

Commands:

git fetch origin main
git checkout feature-branch
git rebase origin/main
# Conflict resolution
# Unexpected commits show up

# Fix:
git reflog
git reset --hard <safe-commit-hash>

Lab 3: Force Push Wipes Teammate's Work

Scenario:

Two devs force-push to same branch.

Objective:

Recover lost work with reflog. Understand --force-with-lease.

Commands:

git reflog  # Identify lost commit
git branch recover <commit>
# Discuss: git push --force-with-lease

Lab 4: Squash and Merge Lost Credit

Scenario:

Squash used during merge, authorship lost.

Objective:

Preserve co-authors using Co-authored-by lines.

Tips:

Use meaningful commit messages

Include:

Co-authored-by: Name <email>

Lab 5: Cherry-Pick Missed Dependency

Scenario:

Cherry-pick a fix without related commits, leads to broken feature.

Objective:

Trace all related changes before cherry-picking.

Commands:

git log -p  # See full patch
git show <commit>
git blame <file>

Lab 6: Merge Conflict in Lock/Project Files

Scenario:

Conflict in JSON or XML (package-lock, csproj).

Objective:

Resolve using visual tools.

Tools:

git mergetool

VSCode Merge Editor

Meld / Beyond Compare

Section: Pro Git Skills

Mini Lab: Reuse Recorded Resolution (rerere)

Scenario:

You're resolving the same conflict repeatedly across rebases or merges.

Objective:

Enable and use Git's rerere feature to automatically recall and reapply previous conflict resolutions.

Steps:

Enable rerere:

git config --global rerere.enabled true

Create a conflict:

git checkout -b branch-a
# Edit a file and commit

git checkout main
# Edit the same line in the same file and commit

git checkout -b branch-b
# Try merging branch-a

git merge branch-a  # You'll get a conflict

Resolve the conflict manually and commit:

git add .
git commit -m "Manual conflict resolution"

Reset and repeat the merge:

git reset --hard HEAD~1

git merge branch-a  # This time, rerere applies the resolution automatically

Bonus:

Inspect the rerere cache:

ls .git/rr-cache/

Clean up:

git rerere gc

Wrap-Up Discussion

Topics:

Rebase vs Merge vs Squash

Team conventions and protected branches

GitHub flow: stuck PRs, clean diffs

CI/CD integration strategies

Assets To Provide



Let's make Git a tool of mastery, not misery.

