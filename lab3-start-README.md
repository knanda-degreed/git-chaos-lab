# 🧨 Lab 3: Force Push Wipes Teammate’s Work

In this lab, you’ll simulate a classic Git disaster: **you force-push and accidentally delete someone else’s work**.

Then you’ll learn how to use `git reflog` to bring it all back.

---

## 🧭 Scenario

- Teammate and you both work on `main`
- You commit and push
- Your teammate commits and pushes
- You force-push your version — theirs is gone
- Use `reflog` to find and fix it

---

## 🎯 Goal

Practice:
- Collaborating on a shared branch
- Simulating diverging local changes
- Using `git push --force` (aka danger zone)
- Recovering lost commits with `git reflog`

---

## 🛠️ Setup

Start from this lab:
```bash
git checkout lab3-start
```

Initial commit:
```bash
echo "Initial" > file.txt
git add file.txt
git commit -m "Initial commit"
```

Simulate teammate’s commit (in a second terminal or pretend):
```bash
echo "Teammate change" >> file.txt
git commit -am "Teammate commit"
```

Now YOU make a different change:
```bash
git reset --hard HEAD~1
echo "Your change" > file.txt
git commit -am "Your local change"
```

Now force-push:
```bash
git push origin +HEAD  # or: git push --force
```

---

## 💥 What Just Happened?

You’ve **overwritten history** on the remote. The teammate’s commit is **gone** from the visible log.

---

## 🧙‍♂️ Recover with `reflog`

```bash
git reflog
```

Find your teammate’s commit SHA (before your reset).

Recover with:
```bash
git checkout <SHA>
# or:
git cherry-pick <SHA>
```

---

## ✅ Done!

You’ve now:
- Wiped a commit by force-pushing
- Used `reflog` to find it
- Restored the lost work

You’re now qualified to fix production Git mistakes 😄