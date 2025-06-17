# 🧭 Lab 5: Git Bisect — Find the Bug!

In this lab, you'll simulate a long history of changes, then use `git bisect` to pinpoint which commit introduced a regression.

---

## 🎯 Goal

Practice:
- Using `git bisect`
- Marking commits as good/bad
- Automating bug discovery

---

## 🛠️ Setup

This lab assumes you've run:

```bash
chmod +x setup-lab5-bisect.sh
./setup-lab5-bisect.sh
```

Which creates:
- 109 dummy commits with a working `script.sh`
- 1 final commit that breaks it

To verify:
```bash
git log --oneline --graph --decorate
cat script.sh
```

---

## 🔍 Run Bisect

Start bisecting from latest:

```bash
git bisect start
git bisect bad HEAD
git bisect good HEAD~110
```

Now Git will walk you through history. After each step:

```bash
./script.sh
```

Then tell Git:
```bash
git bisect good
# or
git bisect bad
```

---

## 🤖 Automate with Script

You can run this instead:

```bash
git bisect reset
git bisect start
git bisect bad
git bisect good HEAD~110
git bisect run ./script.sh
```

---

## ✅ Done!

- Bisect helps you debug across massive commit ranges
- This works on scripts, tests, or even compiled projects

Rejoice, you now have laser-guided blame.