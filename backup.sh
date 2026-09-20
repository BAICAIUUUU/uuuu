#!/bin/bash
# Claude Code 配置备份：生成脱敏副本 -> 提交 -> 推送
# 用法: bash ~/.claude/backup.sh （也可由 Windows 计划任务调用）
set -e
: "${HOME:=$USERPROFILE}"   # 计划任务环境下 HOME 可能未设置
cd ~/.claude

# 1. 全局配置快照（无凭证，含机器/用户ID，仅存私有仓库）
cp ~/.claude.json global-claude.json

# 2. 生成脱敏版 settings.json（token/key/secret 一律替换为 ***）
python - <<'PYEOF'
import json, os, re
SENS = re.compile(r'token|key|secret|password', re.I)
def scrub(o):
    if isinstance(o, dict):
        return {k: ('***' if SENS.search(k) and isinstance(v, str) else scrub(v)) for k, v in o.items()}
    if isinstance(o, list):
        return [scrub(i) for i in o]
    return o
src = os.path.expanduser('~/.claude/settings.json')
with open(src, encoding='utf-8') as f:
    data = json.load(f)
with open(os.path.expanduser('~/.claude/settings.sanitized.json'), 'w', encoding='utf-8') as f:
    json.dump(scrub(data), f, indent=2, ensure_ascii=False)
PYEOF

# 3. 提交并推送（BatchMode+超时，断网/无 key 时直接跳过不挂起）
git add -A
git commit -m "backup $(date '+%F %T')" || echo "nothing to commit"
GIT_SSH_COMMAND="ssh -o ConnectTimeout=15 -o BatchMode=yes" git push || echo "push skipped"
