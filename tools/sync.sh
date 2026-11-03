#!/usr/bin/env bash
# Sinh các file rules từ AGENTS.md. Chỉ sửa AGENTS.md, không sửa tay các bản copy.
#   tools/sync.sh           ghi lại bản copy
#   tools/sync.sh --check   báo lỗi nếu bản copy bị lệch

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
COPIES=(CLAUDE.md .windsurfrules .clinerules .github/copilot-instructions.md)
CURSOR=.cursor/rules/law-audit.mdc
FRONT='---
description: Audit pháp lý web, app, dApp theo luật Việt Nam và quốc tế, trọng tâm crypto, stablecoin, onchain
globs:
alwaysApply: false
---'

cursor_body() { printf '%s\n\n' "$FRONT"; cat "$ROOT/AGENTS.md"; }

if [ "${1:-}" = "--check" ]; then
  drift=0
  for f in "${COPIES[@]}"; do
    diff -q --strip-trailing-cr "$ROOT/AGENTS.md" "$ROOT/$f" >/dev/null 2>&1 || { echo "LỆCH: $f"; drift=1; }
  done
  cursor_body | diff -q --strip-trailing-cr - "$ROOT/$CURSOR" >/dev/null 2>&1 || { echo "LỆCH: $CURSOR"; drift=1; }
  [ "$drift" = 0 ] && echo "Đồng bộ OK"
  exit $drift
fi

for f in "${COPIES[@]}"; do
  mkdir -p "$(dirname "$ROOT/$f")"
  cp "$ROOT/AGENTS.md" "$ROOT/$f"
done
mkdir -p "$(dirname "$ROOT/$CURSOR")"
cursor_body > "$ROOT/$CURSOR"
echo "Đã sinh lại các file rules."
