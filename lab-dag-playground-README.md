# 🧠 Git Internals Lab: DAG Playground

Welcome to the **Git DAG Playground** — here you’ll create and explore Git history as a Directed Acyclic Graph (DAG). Let’s build and visualize!

---

## 🎯 Goal

Practice the following:
- Merging and rebasing
- Cherry-picking commits
- Visualizing commit history with a DAG

---

## 🧰 Setup

Create base commits:
```bash
echo "A" > file.txt && git add . && git commit -m "A"
echo "B" >> file.txt && git commit -am "B"
echo "C" >> file.txt && git commit -am "C"
```

Create a feature branch:
```bash
git checkout -b feature
echo "D" >> file.txt && git commit -am "D"
echo "E" >> file.txt && git commit -am "E"
```

Switch back to main:
```bash
git checkout main
echo "F" >> file.txt && git commit -am "F"
```

---

## 🔁 Merge & Rebase

Merge feature into main:
```bash
git merge feature  # Resolve conflict if prompted
git add file.txt
git commit -m "Merge feature"
```

Rebase another branch:
```bash
git checkout -b rebased-feature <SHA-of-C>
echo "R1" >> file.txt && git commit -am "R1"
echo "R2" >> file.txt && git commit -am "R2"
git rebase main
```

---

## 🔍 Visualize

```bash
git log --oneline --graph --all --decorate
```

---

## 🍒 Cherry-pick

```bash
git checkout main
git cherry-pick <SHA-of-R2>
```

---

## ✅ Done!

You’ve built and reshaped Git history. You’re now ready for chaos labs.