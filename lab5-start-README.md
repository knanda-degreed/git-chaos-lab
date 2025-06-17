# 🧭 Lab 5: Git Bisect — Find the Bug!

Use `git bisect` to automatically binary search your history for the commit that introduced a bug.

---

## 🎯 Goal

Practice:
- Using `git bisect`
- Marking commits as good/bad
- Automating bug finding

---

## 🛠️ Setup

```bash
git checkout lab5-start
```

Create a script:
```bash
echo "echo 'GOOD'" > script.sh
chmod +x script.sh
git add script.sh
git commit -m "Working version"
```

Break it:
```bash
echo "echo 'BAD'" > script.sh
git commit -am "Broken version"
```

---

## 🔎 Run Bisect

```bash
git bisect start
git bisect bad
git bisect good HEAD~1
```

Git walks you through testing each commit. Mark each one:

```bash
./script.sh
git bisect good  # or bad
```

When done:
```bash
git bisect reset
```

---

## ✅ Done!