#!/usr/bin/env bash
# Chạy scan.sh trên từng dự án mẫu và so với file EXPECTED.
# Tên thư mục ghi loại mong đợi: fixtures/<tên>__TYPE-<loại>/. Có file URL_ONLY thì quét qua URL.

set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PORT=8765
fail=0

# .gitignore loại .env.* nên file giả này được tạo lúc chạy, scan.sh không được đọc nó
FAKE_ENV="$ROOT/tests/fixtures/secrets-and-docs__TYPE-A/.env.txt"
printf 'NOTE=hot_wallet airdrop kyc wagmi\n' > "$FAKE_ENV"
trap 'rm -f "$FAKE_ENV"' EXIT

serve() {
  if command -v python3 >/dev/null; then python3 -m http.server "$PORT" --directory "$1" >/dev/null 2>&1 &
  elif command -v python >/dev/null; then python -m http.server "$PORT" --directory "$1" >/dev/null 2>&1 &
  else echo "Cần python để chạy test URL" >&2; return 1; fi
  server=$!
  sleep 2
}

for dir in "$ROOT"/tests/fixtures/*/; do
  dir="${dir%/}"
  name="$(basename "$dir")"
  expected="$(cat "$dir/EXPECTED")"
  type_in_name="${name##*__TYPE-}"

  if [ -f "$dir/URL_ONLY" ]; then
    serve "$dir" || { fail=1; continue; }
    line="$(bash "$ROOT/scripts/scan.sh" "http://localhost:$PORT/" | grep '^TYPE=')"
    kill "$server" 2>/dev/null
    wait "$server" 2>/dev/null
    mode=url
  else
    line="$(bash "$ROOT/scripts/scan.sh" "$dir" | grep '^TYPE=')"
    mode=dir
  fi

  ok=1
  case " $line " in *" TYPE=$type_in_name "*) ;; *) ok=0 ;; esac
  for kv in $expected; do
    case " $line " in *" $kv "*) ;; *) ok=0 ;; esac
  done

  if [ "$ok" = 1 ]; then
    echo "PASS  $name [$mode]"
  else
    echo "FAIL  $name [$mode]"
    echo "      mong đợi: TYPE=$type_in_name $expected"
    echo "      nhận được: $line"
    fail=1
  fi
done

exit $fail
