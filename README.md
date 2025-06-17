# 👩‍🔧 Git Like a Pro: Real-World Conflict & Chaos Lab

Welcome to the **Git Chaos Lab** — a hands-on workshop built around real-world Git disasters.  
Whether you're just starting or have yelled at `git reset --hard` one too many times, this repo will guide you from survival to mastery.

---

## 🧭 What You’ll Learn

- Everyday Git workflows: branching, pushing, rebasing
- How Git works under the hood (DAG, HEAD, refs, reflog)
- Advanced techniques: resolving conflicts, cherry-picking, rebase vs merge
- Recovery skills for common disasters

---

## 🚦 Workshop Flow

1. ✅ **Warm-up**: Practice Git basics  
   → `git checkout lab0-git-flow`

2. 🧠 **Git Internals & DAG Playground**  
   → `git checkout lab-dag-playground`

3. 💥 **Advanced Chaos Labs**  
   → Choose any lab below (each is its own branch)

---

## 🔬 Available Labs

| Lab Branch             | Scenario |
|------------------------|----------|
| `lab0-git-flow`        | Intro to branching, push/pull, rebase, and conflicts |
| `lab-dag-playground`   | Git Internals: DAGs, merge commits, rebase, cherry-pick |
| `lab1-start`           | Premature Merge – teammate wasn’t done yet |
| `lab2-start`           | Rebase Gone Rogue – history rewritten, panic ensues |
| `lab3-start`           | Force Push Wipes Teammate's Work |
| `lab4-start`           | Squash and Merge Lost Credit |
| `lab5-start`           | Cherry-Pick Missed Dependency |
| `lab6-start`           | Merge Conflict in Lock/Project Files |
| `lab7-start`           | Git Bisect — Binary search your commit history |
| `lab8-start`           | Git Worktree — Parallel workspaces |
| `lab9-start`           | Git Rerere — Remember your resolutions |

> 📌 To start a lab:  
> ```bash
> git checkout lab5-start
> ```

---

## 🛠️ How to Use This Repo

1. **Fork this repo** on GitHub
2. **Clone your fork**:
   ```bash
   git clone https://github.com/YOU/git-chaos-lab.git
   cd git-chaos-lab
