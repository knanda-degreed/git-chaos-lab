# 🚦 Lab 0: Git Basics — Push, Pull, and Branching

Welcome to the **Git Flow Essentials** lab! This is the ideal starting point before diving into chaos. Here, you’ll warm up with everyday Git workflows.

---

## 🎯 Goal

Practice the following:
- Cloning & branching
- Committing & pushing

---

## 🧰 Setup

Create a file and commit it:
```bash
echo "Hello from Lab 0" > intro.txt
git add intro.txt
git commit -m "Initial commit on lab0"
```

---

## 🚀 Push to Remote

If your fork is connected:
```bash
git push origin lab0-git-flow
```

---

## 🧼 Bonus Cleanup Commands

```bash
git stash           # Save local changes
git restore .       # Restore working directory from index
git clean -fd       # Delete untracked files and folders
```

---

## ✅ Done!

You’ve now:
- Created a branch
- Committed changes
- Pushed to remote

You're ready for DAGs and chaos.