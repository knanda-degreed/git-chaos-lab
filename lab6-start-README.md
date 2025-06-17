# 🌲 Lab 6: Git Worktree — Multiple Working Directories

Work on multiple branches in parallel using `git worktree`.

---

## 🎯 Goal

Practice:
- Creating a new worktree
- Working in separate branches side-by-side
- Removing worktrees safely

---

## 🛠️ Setup

```bash
git checkout lab6-start
```

Create a worktree:
```bash
git worktree add -b feature ../lab6-feature lab6-start
```

Now you can:
```bash
cd ../lab6-feature
# work there like normal Git repo
```

---

## 🧼 Clean Up

```bash
cd ../your-main-repo
git worktree remove ../lab6-feature
```

---

## ✅ Done!