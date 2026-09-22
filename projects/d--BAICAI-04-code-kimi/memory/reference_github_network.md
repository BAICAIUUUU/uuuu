---
name: GitHub network access and claude-config backup repo
description: User network blocks github.com HTTPS (443); SSH port 22 works. Claude config backup repo lives at ~/.claude (git) with remote git@github.com:BAICAIUUUU/uuuu.git
type: reference
originSessionId: eaf6ead6-7c75-495c-af82-9abcf1fd8425
---
User's machine (Windows 11, China network) facts verified 2026-09-20:

- `github.com:443` (HTTPS) is blocked/reset (DNS poisoned + SNI blocked; even the real IP 20.205.243.166 fails). `api.github.com` and SSH port 22 to github.com DO work.
- No local proxy (no env vars, no common proxy ports). No gh CLI installed.
- Any git push to GitHub must use SSH remote (`git@github.com:...`), not HTTPS.
- SSH key: `~/.ssh/id_ed25519` (ed25519, no passphrase, registered on GitHub account BAICAIUUUU).
- Claude Code config backup: `~/.claude` is a git repo; remote = `git@github.com:BAICAIUUUU/uuuu.git`; run `bash ~/.claude/backup.sh` to snapshot + commit + push. Sensitive files (settings.json with API tokens, .credentials.json) are gitignored; backup.sh generates `settings.sanitized.json` with tokens scrubbed to `***`.
- Automation: Windows scheduled task `ClaudeConfigBackup` runs backup.sh every 2 hours (`/sc HOURLY /mo 2`, interactive-logon only, StartWhenAvailable=true). Every run appends one line to `~/.claude/backup.log` (gitignored): `[time] commit <hash>|nothing to commit, push OK|skipped`. Verified healthy 2026-09-21/22.

**How to apply:** When a task needs GitHub/git network access from this machine, default to SSH remotes; if github.com HTTPS hangs, don't debug the repo — it's the network. Git identity: baicaiuuuu / baicaiuuuu@163.com.
