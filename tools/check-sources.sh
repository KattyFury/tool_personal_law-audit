#!/usr/bin/env bash
# Kiểm tra bộ checklist:
#   1. Mỗi dòng "- [ ]" có mã nguồn hoặc cờ CHƯA XÁC MINH.
#   2. Mọi mã nguồn trong references/ đều có trong sources/legal-references.md.
#   3. Dòng chỉ dẫn nguồn đang CHƯA XÁC MINH thì phải có cờ ngay trên dòng đó.
#   4. Mọi nguồn khai ĐÃ ĐỐI CHIẾU có ít nhất một link.

set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/sources/legal-references.md"
FLAG="CHƯA XÁC MINH"
ID='[A-Z]+-[A-Z0-9-]+'
fail=0

known="$(grep -E "^\| $ID \|" "$SRC" | awk -F'|' '{gsub(/ /,"",$2); print $2}')"
unverified="$(grep -E "^\| $ID \|" "$SRC" | awk -F'|' -v f="$FLAG" 'index($5,f){gsub(/ /,"",$2); print $2}')"
in_list() { printf '%s\n' "$2" | grep -qx "$1"; }

while IFS= read -r file; do
  rel="${file#$ROOT/}"
  n=0
  while IFS= read -r line; do
    n=$((n + 1))
    ids="$(printf '%s' "$line" | grep -oE "\[$ID\]" | tr -d '[]')"
    for i in $ids; do
      if ! in_list "$i" "$known"; then echo "MÃ LẠ      $rel:$n [$i]"; fail=1; fi
    done
    case "$line" in "- [ ]"*) ;; *) continue ;; esac
    has_flag=0; case "$line" in *"$FLAG"*) has_flag=1 ;; esac
    if [ -z "$ids" ] && [ "$has_flag" = 0 ]; then
      echo "THIẾU NGUỒN $rel:$n"; fail=1; continue
    fi
    if [ "$has_flag" = 0 ]; then
      solid=0
      for i in $ids; do in_list "$i" "$unverified" || solid=1; done
      if [ "$solid" = 0 ]; then echo "THIẾU CỜ   $rel:$n"; fail=1; fi
    fi
  done < "$file"
done < <(find "$ROOT/references" -name '*.md' | sort)

while IFS= read -r row; do
  case "$row" in *"http"*) ;; *) echo "THIẾU LINK  $(printf '%s' "$row" | cut -c1-40)"; fail=1 ;; esac
done < <(grep -E "^\| $ID \|.*ĐÃ ĐỐI CHIẾU" "$SRC")

if [ "$fail" = 0 ]; then echo "Nguồn và cờ OK"; fi
exit $fail
