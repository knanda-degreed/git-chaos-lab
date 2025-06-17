# ✂️ Lab 4: Squash and Merge Lost Credit

In this lab, you’ll simulate what happens when GitHub’s “Squash and Merge” feature rewrites commit history — and how contributor authorship can be lost.

Then you’ll fix it using interactive rebase and `--author`.

---

## 🧭 Scenario

- Two teammates contribute to a branch
- The maintainer squashes and merges their work into `main`
- Now Git log shows the squasher as the only author
- You’ll learn how to fix or avoid this

---

## 🎯 Goal

Practice:
- Making multiple commits as different authors
- Squashing via `rebase -i`
- Editing commit authorship
- Preserving contribution credit

---

## 🛠️ Setup

Start from this lab:
```bash
git checkout lab4-start
```

Create a new branch and simulate multiple authors:
```bash
git checkout -b feature-authors
echo "Line from Alice" > file.txt
git add . && git commit -m "Alice's work" --author="Alice <alice@example.com>"

echo "Line from Bob" >> file.txt
git commit -am "Bob's work" --author="Bob <bob@example.com>"
```

---

## ✂️ Squash and Merge

Simulate what GitHub does:

```bash
git checkout main
git merge --squash feature-authors
git commit -m "Squashed feature work"
```

Now run:
```bash
git log --pretty=full
```

❗ Only one author remains.

---

## 🛠️ Fix It with Rebase

Instead of squashing like that, try:

```bash
git checkout feature-authors
git rebase -i HEAD~2
```

Change:
```
pick abc123 Alice's work
pick def456 Bob's work
```
to:
```
pick abc123 Alice's work
squash def456 Bob's work
```

You’ll be prompted to merge messages. After that:

```bash
git commit --amend --author="Alice and Bob <team@example.com>"
```

Or list both in message body as contributors.

---

## ✅ Done!

You now understand how squash merge rewrites history — and how to preserve contributor credit manually.