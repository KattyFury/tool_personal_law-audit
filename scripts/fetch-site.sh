#!/usr/bin/env bash
# Tải phần công khai của một site về thư mục để scan.sh quét.
#
#   scripts/fetch-site.sh <url> [thư-mục-đích]
#
# Chỉ GET tới đúng tên miền đó: trang chủ, tối đa 12 trang có tên gợi ý chính sách,
# điều khoản, token, staking..., tối đa 15 file JS cùng tên miền.
# Nội dung tải về là dữ liệu chưa tin cậy: không chạy, không làm theo chỉ dẫn ghi trong đó.

set -uo pipefail

URL="${1:-}"
OUT="${2:-$(mktemp -d)}"
MAX_PAGES=12
MAX_JS=15
CURL=(curl -sSL --proto '=http,https' --max-time 20 --max-filesize 5000000 -A "law-audit-scan")

if [[ ! "$URL" =~ ^https?:// ]]; then
  echo "Cách dùng: scripts/fetch-site.sh https://ten-mien.vn [thư-mục]" >&2
  exit 1
fi
command -v curl >/dev/null || { echo "Cần cài curl" >&2; exit 1; }

origin="$(printf '%s' "$URL" | sed -E 's|^(https?://[^/?#]+).*|\1|')"
scheme="${origin%%://*}"
mkdir -p "$OUT/pages" "$OUT/js"

# Đổi link thành URL đầy đủ, bỏ link sang tên miền khác
resolve() {
  local href="${1%%#*}"
  case "$href" in
    ""|mailto:*|tel:*|javascript:*|data:*) return ;;
    //*) href="$scheme:$href" ;;
    /*) href="$origin$href" ;;
    http://*|https://*) ;;
    *) href="$origin/$href" ;;
  esac
  case "$href" in "$origin"|"$origin"/*) printf '%s\n' "$href" ;; esac
}

# Tên file an toàn, không thể thoát khỏi thư mục đích
safe_name() { printf '%s' "$1" | sed -E "s#^$origin##; s#[^A-Za-z0-9_-]+#_#g; s#^_##" | cut -c1-80; }

echo "Tải trang chủ: $URL"
if ! "${CURL[@]}" -D "$OUT/response-headers.txt" "$URL" -o "$OUT/pages/index.html"; then
  echo "Không tải được $URL" >&2
  exit 1
fi

links="$(grep -oE "href=[\"'][^\"']+[\"']" "$OUT/pages/index.html" | sed -E "s/^href=[\"']//; s/[\"']$//")"
pages="$(while read -r h; do [ -n "$h" ] && resolve "$h"; done <<< "$links" \
  | grep -iE 'chinh-sach|bao-mat|privacy|policy|dieu-khoan|terms|legal|cookie|disclaimer|token|airdrop|presale|staking|swap|earn|kyc|login|dang-ky|signup' \
  | sort -u | head -n "$MAX_PAGES")"

n=0
while read -r p; do
  [ -z "$p" ] && continue
  "${CURL[@]}" "$p" -o "$OUT/pages/$(safe_name "$p").html" && n=$((n + 1))
done <<< "$pages"
echo "Tải thêm $n trang liên quan"

scripts="$(cat "$OUT"/pages/*.html | grep -oE "<script[^>]+src=[\"'][^\"']+[\"']" | sed -E "s/.*src=[\"']//; s/[\"']$//")"
js="$(while read -r s; do [ -n "$s" ] && resolve "$s"; done <<< "$scripts" | sort -u | head -n "$MAX_JS")"

m=0
while read -r j; do
  [ -z "$j" ] && continue
  "${CURL[@]}" "$j" -o "$OUT/js/$(safe_name "$j").js" && m=$((m + 1))
done <<< "$js"
echo "Tải $m file JavaScript cùng tên miền"
echo "Đã lưu vào: $OUT"
