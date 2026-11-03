#!/usr/bin/env bash
# Cài bộ audit vào một project.
#   ./install.sh /đường/dẫn/project                      chạy từ bản clone của repo này
#   curl -fsSL <link raw của install.sh> | bash          tải từ GitHub rồi cài vào thư mục hiện tại
#
# Mọi thứ nằm trong .law-audit/. Không ghi đè file của project:
#   - file rules chưa có thì tạo mới với 1 đoạn trỏ
#   - có rồi thì chèn đoạn đó vào cuối, chạy lại không chèn trùng

set -euo pipefail

REPO="${LAW_AUDIT_REPO:-https://github.com/KattyFury/tool_personal_law-audit}"
TARGET="${1:-.}"
KIT="$TARGET/.law-audit"
START="<!-- law-audit:start -->"
END="<!-- law-audit:end -->"

if [ ! -d "$TARGET" ]; then
  echo "Không tìm thấy thư mục: $TARGET" >&2
  exit 1
fi

# Chạy từ bản clone thì dùng luôn, không gọi mạng
SELF="${BASH_SOURCE[0]:-}"
SRC=""
if [ -n "$SELF" ] && [ -f "$SELF" ]; then
  HERE="$(cd "$(dirname "$SELF")" && pwd)"
  [ -f "$HERE/AGENTS.md" ] && [ -d "$HERE/references" ] && SRC="$HERE"
fi
TMP=""
cleanup() { if [ -n "$TMP" ]; then rm -rf "$TMP"; fi; }
trap cleanup EXIT
if [ -z "$SRC" ]; then
  TMP="$(mktemp -d)"
  echo "Đang tải từ $REPO"
  git clone --depth 1 --quiet "$REPO" "$TMP/repo"
  SRC="$TMP/repo"
fi

# .law-audit/ là thư mục của bộ này nên được thay mới mỗi lần cài
if [ "$(cd "$TARGET" && pwd)" = "$SRC" ]; then
  echo "Đây là chính repo law-audit, không cài vào đây." >&2
  exit 1
fi
rm -rf "$KIT"
mkdir -p "$KIT"
cp "$SRC/AGENTS.md" "$SRC/SKILL.md" "$SRC/DISCLAIMER.md" "$KIT/"
cp -r "$SRC/references" "$SRC/sources" "$SRC/examples" "$SRC/scripts" "$KIT/"

POINTER="$START
## Audit pháp lý (law-audit)

Khi được yêu cầu audit pháp lý dự án này, đọc và làm theo \`.law-audit/AGENTS.md\`. Mọi đường dẫn trong file đó tính từ \`.law-audit/\`.
$END"

add_pointer() {
  local file="$1"
  mkdir -p "$(dirname "$file")"
  if [ -f "$file" ] && grep -qF "$START" "$file"; then
    echo "  bỏ qua  $file (đã có)"
  elif [ -f "$file" ]; then
    printf '\n%s\n' "$POINTER" >> "$file"
    echo "  chèn    $file"
  else
    printf '%s\n' "$POINTER" > "$file"
    echo "  tạo     $file"
  fi
}

for f in AGENTS.md CLAUDE.md .windsurfrules .clinerules .github/copilot-instructions.md; do
  add_pointer "$TARGET/$f"
done

# File riêng của bộ này trong thư mục rule của Cursor
mkdir -p "$TARGET/.cursor/rules"
cat > "$TARGET/.cursor/rules/law-audit.mdc" <<EOF
---
description: Audit pháp lý web, app, dApp theo luật Việt Nam và quốc tế, trọng tâm crypto
globs:
alwaysApply: false
---

$POINTER
EOF
echo "  ghi     $TARGET/.cursor/rules/law-audit.mdc"

echo
echo "Xong. Bộ audit nằm ở $KIT"
echo "Mở AI của bạn và gõ: audit pháp lý dự án này"
