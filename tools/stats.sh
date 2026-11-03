#!/usr/bin/env bash
# Đếm mục đã xác minh và chưa xác minh, ghi vào đầu sources/legal-references.md.
#   tools/stats.sh           ghi lại khối thống kê
#   tools/stats.sh --check   báo lỗi nếu số đang ghi đã lệch

set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/sources/legal-references.md"
FLAG="CHƯA XÁC MINH"
ID='[A-Z]+-[A-Z0-9-]+'

src_total="$(grep -cE "^\| $ID \|" "$SRC")"
src_ok="$(grep -E "^\| $ID \|" "$SRC" | awk -F'|' 'index($5,"ĐÃ ĐỐI CHIẾU"){c++} END{print c+0}')"
src_no="$(grep -E "^\| $ID \|" "$SRC" | awk -F'|' -v f="$FLAG" 'index($5,f){c++} END{print c+0}')"

items=0; items_flag=0; rows=""
while IFS= read -r file; do
  t="$(grep -c '^- \[ \]' "$file")"
  f="$(grep '^- \[ \]' "$file" | grep -c "$FLAG")"
  items=$((items + t)); items_flag=$((items_flag + f))
  rows="$rows| \`${file#$ROOT/references/}\` | $t | $f |
"
done < <(find "$ROOT/references" -name '*.md' | sort | while read -r x; do grep -q '^- \[ \]' "$x" && echo "$x"; done)

total_flag="$(grep -rho "$FLAG" "$ROOT/references" | wc -l | tr -d ' ')"
items_ok=$((items - items_flag))

block="$(mktemp)"
{
  echo "<!-- stats:start -->"
  echo "**Thống kê (do \`tools/stats.sh\` đếm, không điền tay)**"
  echo
  echo "- Văn bản: $src_total, trong đó $src_ok ĐÃ ĐỐI CHIẾU và $src_no $FLAG."
  echo "- Mục checklist: $items, trong đó $items_ok có nguồn không kèm cờ và $items_flag gắn cờ $FLAG."
  echo "- Tổng số lần ghi cờ $FLAG trong \`references/\`, kể cả ngoài checklist: **$total_flag**."
  echo
  echo "| File | Mục | Gắn cờ |"
  echo "|---|---|---|"
  printf '%s' "$rows"
  echo "<!-- stats:end -->"
} > "$block"

new="$(mktemp)"
awk -v b="$block" '
  /<!-- stats:start -->/ { while ((getline l < b) > 0) print l; skip=1; next }
  /<!-- stats:end -->/ { skip=0; next }
  !skip { print }
' "$SRC" > "$new"

if [ "${1:-}" = "--check" ]; then
  if diff -q --strip-trailing-cr "$SRC" "$new" >/dev/null; then echo "Thống kê khớp"; rc=0
  else echo "Thống kê đã lệch, chạy tools/stats.sh"; rc=1; fi
  rm -f "$block" "$new"
  exit $rc
fi

cat "$new" > "$SRC"
rm -f "$block" "$new"
echo "Văn bản: $src_ok đã đối chiếu, $src_no chưa xác minh. Mục: $items, gắn cờ $items_flag."
