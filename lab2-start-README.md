# 🔄 Lab 2: Rebase Gone Rogue

In this lab, you’ll simulate one of the most common — and terrifying — Git nightmares: **a rebase gone wrong.**

You’ll rebase a feature branch onto a changing mainline, resolve conflicts incorrectly, and recover using `git reflog`.

---

## 🧭 Scenario

- You’re on a `feature` branch with 2 commits
- You try to rebase onto a fast-moving `main`
- During the rebase, you resolve a conflict incorrectly
- You realize something is missing afterward
- You’ll then recover using `git reflog`

---

## 🎯 Goal

Practice:
- Performing a rebase
- Handling rebase conflicts
- Making a mistake during resolution
- Recovering via `git reflog`

---

## 🛠️ Setup

Start from this lab:
```bash
git checkout lab2-start
```

Simulate base history:
```bash
echo "Base" > file.txt && git add . && git commit -m "Base commit"
```

Create a `feature` branch and make two commits:
```bash
git checkout -b feature
echo "Feature A" >> file.txt && git commit -am "Feature A"
echo "Feature B" >> file.txt && git commit -am "Feature B"
```

Now simulate `main` moving forward:
```bash
git checkout main
echo "Main A" >> file.txt && git commit -am "Main A"
```

---

## 💥 The Rebase

```bash
git checkout feature
git rebase main
```

You'll likely hit a conflict.

**Do this on purpose**: resolve only part of the file — miss some content.

```bash
# Edit file.txt
# Leave out "Feature B" during conflict resolution
git add file.txt
git rebase --continue
```

---

## 🤯 Now What?

You realize: “Wait — my `Feature B` is missing!”

Check with:
```bash
git log --oneline
```

---

## 🧙 Recover with Reflog

```bash
git reflog
```

Look for the SHA before the rebase started:
```bash
git checkout HEAD@{2}
```

You can cherry-pick or reset from there.

---

## ✅ Done!

You’ve now:
- Misused rebase (on purpose)
- Lost a commit
- Recovered it using `git reflog`

Real Git chaos. Real confidence.