<img width="841" alt="Screenshot 2025-06-22 at 10 51 31 AM" src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" />



# Git Push Notes — Safe Workflow for macOS Terminal
*Your personal reference. No AI needed once you know this.*

---

## 0. The Golden Rules (read this first, every time)

1. **`git push` (normal) = safe.** It only ADDS your new commits on top of what's already there.
2. **`git push --force` = DANGEROUS.** It can **overwrite and permanently delete** commits on GitHub that you don't have locally — including other people's work, or your own older work from another machine.
3. **You almost never need `--force`.** In 95% of real workflows, you will never type it.
4. **Before anything risky, make a backup folder copy.** A 10-second `cp -R` can save you months of work.
5. **If a push is rejected, do NOT force it. Stop and read why first.**

---

## 1. Basic Vocabulary (so commands make sense)

| Term | Meaning |
|---|---|
| **Repository (repo)** | The project folder tracked by Git |
| **Remote** | The GitHub copy of your repo (usually named `origin`) |
| **Branch** | A line of development (usually `main`) |
| **Commit** | A saved snapshot of your changes |
| **Working directory** | Your actual files on your Mac right now |
| **Staging area** | Files marked "ready to be committed" (`git add`) |

---

## 2. One-Time Setup (per repo, per Mac)

Open **Terminal** (Cmd+Space → type "Terminal").

```bash
# Check git is installed
git --version

# Set your identity (only needed once per machine)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

### Option A — You already have the repo on GitHub, but not on your Mac
```bash
cd ~/Documents          # or wherever you want it
git clone https://github.com/raghuramofficial07/iOS.git
cd iOS
```

### Option B — You already have the folder on your Mac, just need to connect it
```bash
cd /path/to/your/local/folder
git init
git remote add origin https://github.com/raghuramofficial07/iOS.git
git remote -v            # confirms it's connected correctly
```

---

## 3. Daily Safe Workflow (use this 99% of the time)

This is the **only sequence you need for normal work**:

```bash
# 1. Go to your repo
cd ~/Documents/iOS

# 2. ALWAYS pull first — this merges in anything new from GitHub
git pull origin main

# 3. See what changed
git status

# 4. Add ONLY the file(s) you want — never blindly add everything if unsure
git add SwiftNotes/MyNewFile.swift

# 5. Commit with a clear message
git commit -m "Add notes on Optionals in Swift"

# 6. Push normally (NO force)
git push origin main
```

✅ This never touches or deletes anything else in the repo.
✅ `git add <specific-file-or-folder>` only stages that file — it does not affect other files already on GitHub.

---

## 4. Pushing to a Specific Folder/Path Inside the Repo

Your repo: `https://github.com/raghuramofficial07/iOS`
Target folder: `SwiftNotes` (i.e. `.../iOS/tree/main/SwiftNotes`)

GitHub doesn't have "folders" as a separate push target — a folder is just a path *inside* your repo. So you push to the **repo**, and the folder is decided by **where the file lives on your Mac, matching the same path**.

### Step-by-step:

```bash
# 1. Go into your cloned repo
cd ~/Documents/iOS

# 2. Make sure you're up to date
git pull origin main

# 3. Go into (or create) the exact folder you want
mkdir -p SwiftNotes        # only creates it if it doesn't exist — safe, won't delete anything
cd SwiftNotes

# 4. Put/copy your file here (example: copying a file from Desktop)
cp ~/Desktop/Optionals.md ./SwiftNotes/

# 5. Go back to repo root to run git commands
cd ~/Documents/iOS

# 6. Stage ONLY that file
git add SwiftNotes/Optionals.md

# 7. Commit
git commit -m "Add Optionals.md to SwiftNotes"

# 8. Push
git push origin main
```

Result: only `SwiftNotes/Optionals.md` is added on GitHub. Nothing else in the repo is touched.

> **Like your "geetha.com/name" example:** think of it as
> `repo-root/SwiftNotes/yourfile` = `geetha.com/SwiftNotes/yourfile`.
> The path inside your local folder becomes the path on GitHub. There's no separate "push to a folder" command — the folder path is just part of the file's location.

---

## 5. Adding a New File Without Touching Anything Else

```bash
git status               # ALWAYS check this first — shows exactly what changed
git add path/to/newfile.swift
git commit -m "Add newfile.swift"
git push origin main
```

**Never run `git add .` or `git add -A` unless you've checked `git status` first and you genuinely want everything listed there added.** This is the #1 cause of accidentally including files you didn't mean to.

---

## 6. When `--force` Is NEVER Okay (default assumption)

❌ Do not use `--force` when:
- Push is rejected and you don't fully understand why
- You're not sure if anyone else (or another of your own machines) has newer commits
- You just want to "make the error go away"
- You're tired, rushed, or unsure — **stop and walk away instead**

### What a normal rejected push looks like (THIS IS SAFE, EXPECTED BEHAVIOR):
```
! [rejected]        main -> main (fetch first)
error: failed to push some refs
```
This means GitHub has commits you don't have locally. **The fix is `git pull`, not `--force`:**
```bash
git pull origin main
# resolve any merge conflicts if shown
git push origin main
```
This is what 99% of "force push temptation" situations actually need.

---

## 7. When `--force` (or `--force-with-lease`) Is Legitimately Used

Rare, intentional cases only:

- You rewrote your **own** commit history (e.g. `git rebase`, `git commit --amend`) on a **personal branch nobody else uses**
- You need to undo a bad commit you *just* pushed by yourself, alone, on a solo project
- You're 100% certain no other device/person has work you'd be erasing

### The SAFE version of force push (use this, never plain `--force`):
```bash
git push --force-with-lease origin main
```
**Why this is safer:** `--force-with-lease` checks that nobody else (including a past version of yourself from another machine) has pushed anything new since your last pull. If something unexpected is there, it **refuses** instead of destroying it. Plain `--force` has no such safety check — it deletes blindly.

### Before ANY force push, do this backup step (10 seconds, saves everything):
```bash
cp -R ~/Documents/iOS ~/Desktop/iOS-backup-$(date +%Y%m%d-%H%M)
```
Now even if something goes wrong, you have a full folder copy on your Desktop.

---

## 8. If You Already Force-Pushed and Lost Commits — Recovery Steps

Try these immediately, in order, **before doing anything else**:

```bash
# 1. Check your local reflog — Git keeps a hidden history even after force push
git reflog

# Look for a commit hash from before the force push, e.g.:
# a1b2c3d HEAD@{2}: commit: my lost work

# 2. Recover it into a new branch (doesn't risk anything)
git checkout -b recovered-work a1b2c3d

# 3. Push that recovered branch safely (normal push, no force)
git push origin recovered-work
```

If `git reflog` shows nothing locally, check:
- **GitHub itself** → repo → "Insights" → look for old states, or check if anyone forked it
- Any **other computer** that hasn't pulled the force-pushed change yet — that copy is still safe! Pull from there instead.
- GitHub Support can sometimes recover recently-deleted data on a repo within a short window — worth emailing them if it's recent and important.

---

## 9. Quick Command Cheat-Sheet

| Goal | Command |
|---|---|
| See what's changed | `git status` |
| See file-by-file changes | `git diff` |
| Stage one file | `git add path/to/file` |
| Stage everything (careful!) | `git add .` |
| Commit | `git commit -m "message"` |
| Get latest from GitHub | `git pull origin main` |
| Push normally | `git push origin main` |
| Safe "force" (rare) | `git push --force-with-lease origin main` |
| See commit history | `git log --oneline` |
| See hidden recovery history | `git reflog` |
| Backup folder before risky action | `cp -R folder folder-backup-$(date +%Y%m%d)` |

---

## 10. Pushing a Large Project (45,000+ Files)

Big projects need a few extra steps. The danger isn't Git breaking — it's the push timing out, GitHub rejecting huge files, or you accidentally uploading junk (like `node_modules`, build folders, `.DS_Store`) that bloats everything.

### 10.1 Know GitHub's real limits

| Limit | Value |
|---|---|
| Single file size | 100 MB hard limit (warns at 50 MB) |
| Recommended repo size | Under ~1–5 GB total |
| Number of files | No hard GitHub limit, but very large counts slow Git down locally |

If you have files over 100MB (videos, datasets, .zip builds, etc.), they will be **rejected** — you need **Git LFS** (see 10.4).

### 10.2 Clean up BEFORE you add anything — this matters most

```bash
cd ~/Documents/MyBigProject

# See total size and rough file count first
du -sh .
find . -type f | wc -l
```

Create a `.gitignore` file so junk never gets staged in the first place:

```bash
nano .gitignore
```
Paste in common exclusions (edit to fit your project type):
```
.DS_Store
node_modules/
build/
dist/
*.log
.env
DerivedData/
*.xcuserstate
```
Save (Ctrl+O, Enter, Ctrl+X in nano).

```bash
git add .gitignore
git commit -m "Add gitignore"
```

This alone can shrink 45,000 files down to a fraction — most of that count is usually generated/dependency files you don't need to push at all.

### 10.3 Check for oversized files before staging

```bash
# Find any file bigger than 50MB
find . -type f -size +50M -not -path "./.git/*"
```
If anything shows up, either delete it, add it to `.gitignore`, or set it up with Git LFS (next section).

### 10.4 If you truly have large files (videos, datasets, models) — use Git LFS

```bash
# Install once (via Homebrew)
brew install git-lfs
git lfs install

# Tell it which file types to track
git lfs track "*.mp4"
git lfs track "*.psd"

git add .gitattributes
git commit -m "Set up Git LFS tracking"
```
Now those file types upload through LFS instead of normal Git, avoiding the 100MB rejection.

### 10.5 Increase Git's buffer for a smoother large push (one-time)

Large pushes sometimes fail with `RPC failed; curl 56` due to default buffer size. Fix once:
```bash
git config --global http.postBuffer 524288000
```

### 10.6 The actual push, step by step

```bash
cd ~/Documents/MyBigProject

git init                                  # only if not already a repo
git remote add origin https://github.com/raghuramofficial07/iOS.git   # only if not already connected

# Stage everything EXCEPT what .gitignore excludes
git add .

git status        # sanity check — scroll through, make sure nothing unwanted is listed

git commit -m "Initial commit: full project"

git push -u origin main
```

`-u origin main` links your local `main` branch to GitHub's `main` so future pushes can just be `git push`.

### 10.7 If the push stalls or times out on a huge first commit

Split it into smaller commits instead of one giant 45,000-file commit:

```bash
# Example: push folder by folder
git add SwiftNotes/
git commit -m "Add SwiftNotes folder"
git push origin main

git add OtherFolder/
git commit -m "Add OtherFolder"
git push origin main
```
Smaller pushes are far less likely to fail, and if one does fail, you've lost far less progress.

### 10.8 Quick checklist for the big push

- [ ] Ran `du -sh .` and `find . -type f | wc -l` to know what I'm dealing with
- [ ] Created `.gitignore` BEFORE running `git add .`
- [ ] Checked for files over 50MB with `find . -type f -size +50M`
- [ ] Set up Git LFS if I have any large media/binary files
- [ ] Increased `http.postBuffer` for smoother upload
- [ ] Pushed in smaller batches if the project is split into clear folders
- [ ] Used `git status` before every commit to confirm nothing unwanted is included

---

## 11. Final Checklist Before Every Push

- [ ] Ran `git status` and reviewed what's staged
- [ ] Ran `git pull origin main` first
- [ ] Only added the specific files I meant to (`git add <file>`, not blind `git add .`)
- [ ] Commit message clearly describes the change
- [ ] If push is rejected → I will `pull`, **not** `force`
- [ ] If I ever consider `--force`, I use `--force-with-lease` and back up the folder first
