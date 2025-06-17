# 💣 Lab 1: The Premature Merge

Welcome to your first real-world Git nightmare: **merging a branch too soon**.  
In this lab, you’ll simulate what happens when one developer merges before another is done — and how to recover cleanly.

---

## 🧭 Scenario

- You’re working on `main`
- A teammate is working on `feature`
- You merge `feature` before they’ve finished
- Teammate then force-pushes more work to `feature`
- Chaos ensues

---

## 🎯 Goal

Practice:
- Merging a branch
- Seeing the consequence of premature merges
- Using `git revert` to undo a merge commit
- Understanding why merges can’t always be fast-forwarded

---

## 🛠️ Setup

Start from this lab:
```bash
git checkout lab1-start
```

Simulate some history:

```bash
echo "Main A" > file.txt && git add . && git commit -m "Main A"
git checkout -b feature
echo "Feature A" >> file.txt && git commit -am "Feature A"
git checkout main
git merge --no-ff feature -m "Merged too early"
```

Now pretend your teammate pushes more work to `feature`:
```bash
git checkout feature
echo "Feature B" >> file.txt && git commit -am "Feature B"
```

Go back to main:
```bash
git checkout main
```

---

## 💥 What Just Happened?

You merged `feature` when it only had one commit.  
But your teammate added more — now `feature` has commits that `main` doesn’t!

Try merging again:
```bash
git merge feature
```

Git will say:
```text
Already up to date.
```

But clearly — it’s **not.**

---

## 🧹 Solution Options

### Option 1: Revert the Merge
```bash
git log --oneline  # Find merge commit SHA
git revert -m 1 <SHA>
```

This undoes the merge cleanly.

---

### Option 2: Reset Main (risky!)
```bash
git reset --hard HEAD~1
```

This removes the merge commit. Don't do this on shared branches.

---

## ✅ Done!

You’ve now seen what happens when a merge happens too early and how to recover using revert or reset.

This is just the beginning 😈