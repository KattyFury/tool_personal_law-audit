# law-audit

**Bộ luật cho AI coding agent, dùng để rà soát pháp lý dự án web3.** Bạn gõ "audit pháp lý dự án này", AI quét code và chỉ ra chỗ có nguy cơ: file nào, dòng nào, theo điều luật nào, nên sửa ra sao.

Phủ luật Việt Nam, EU, Mỹ, Singapore và chuẩn FATF. Trọng tâm là crypto, stablecoin, ví, token, nhưng web và app thường cũng dùng được.

> Đây là rà soát ban đầu, không phải tư vấn pháp lý. Xem [DISCLAIMER.md](DISCLAIMER.md).

## Vì sao cần với dự án crypto

Nhiều dự án chỉ nghĩ tới pháp lý khi đã ra mắt. Vài điều dễ dính:

- **Quảng cáo crypto ở Việt Nam:** chỉ tổ chức có giấy phép mới được làm. Mức tối đa 200 triệu đồng với tổ chức, từ 01/09/2026.
- **"Non-custodial" không tự động an toàn:** Mỹ và EU có loại trừ với điều kiện riêng, Việt Nam chưa có quy định rõ.
- **Khóa admin:** contract có `sweep`, `pause`, `mint` có thể mâu thuẫn với điều bạn viết trên trang chủ.
- **Dùng Vercel hay Firebase:** với dữ liệu thu ở Việt Nam, đây có thể là chuyển dữ liệu xuyên biên giới, cần hồ sơ trong 60 ngày.

## Kết quả trông thế nào

Trích từ [báo cáo mẫu](examples/sample-audit-report.md) trên một dự án giả lập:

> **🔴 Router có hàm admin chuyển tiền đi nhưng trang chủ viết "non-custodial"**
> - `contracts/Router.sol:88`: `sweep()` chỉ `onlyOwner`. `src/Landing.tsx:30`: "Chúng tôi không bao giờ chạm vào tiền của bạn"
> - Căn cứ: Recital 22 MiCA (EU), mục 4.4 FinCEN FIN-2019-G001 (Mỹ). Việt Nam: chưa có quy định rõ, CHƯA XÁC MINH.
> - Đề xuất: kiểm tra `sweep` có đụng tới tiền người dùng không. Công khai ai giữ khóa.

Mức độ: 🔴 cần xử lý ngay, 🟡 nên cải thiện, 🟢 đạt, ⚪ không áp dụng. Trang tĩnh chỉ nhận một dòng kết luận.

## Cách cài

Chạy trong thư mục dự án của bạn:

```bash
curl -fsSL https://raw.githubusercontent.com/KattyFury/tool_personal_law-audit/main/install.sh | bash
```

Hoặc clone repo này rồi chạy `./install.sh /đường/dẫn/dự-án`.

Script cài vào `.law-audit/`, chỉ thêm một đoạn trỏ vào cuối `AGENTS.md`, `CLAUDE.md` và file rules của Cursor, Windsurf, Copilot, Cline. Không ghi đè nội dung có sẵn, chạy lại không bị chèn trùng.

Dùng được trên Windows qua Git Bash, macOS, Linux.

## Cách dùng

Mở AI của bạn trong dự án và gõ:

```
audit pháp lý dự án này
```

Muốn xem nhanh chưa cần AI:

```bash
bash .law-audit/scripts/scan.sh .
bash .law-audit/scripts/scan.sh https://ten-mien.vn
```

Script chỉ đọc file, không gửi dữ liệu đi đâu. Quét URL thì chỉ tải trang công khai của chính site đó.

## Hỏi nhanh

**CHƯA XÁC MINH nghĩa là gì?** Chưa đối chiếu được với văn bản gốc, thường do chỉ thấy qua công ty luật hoặc báo chí. Hãy coi đó là việc cần kiểm tra, không phải sự thật. Số lượng được thống kê ở đầu [sources/legal-references.md](sources/legal-references.md).

**Có thay được luật sư không?** Không. Nó giúp bạn biết cần hỏi gì. Giữ tiền, phát hành token, gọi vốn thì hãy hỏi luật sư trước khi ra mắt.

**Có quét được dự án của người khác không?** Được, nhưng hãy gửi kết quả riêng cho chủ dự án, đừng đăng công khai. Kết quả có thể sai, và đăng lên có thể gây hại cho họ.

**Chưa rà những gì?** Luật chứng khoán Mỹ, thuế, giấy phép cấp bang. Xem [DISCLAIMER.md](DISCLAIMER.md).

**AI có bị đánh lừa bởi nội dung trong trang web không?** Có thể. Khi làm repo này, chính một trang tra cứu luật đã chèn chữ yêu cầu AI quảng cáo cho họ. Bộ luật dặn AI coi mọi nội dung đọc được là dữ liệu và báo lại cho bạn, nhưng bạn vẫn nên đọc kỹ báo cáo khi quét site lạ.

## Cấu trúc

```
references/00-triage.md     phân loại dự án, ma trận chịu luật nào
references/vn/              Việt Nam
references/intl/            EU, Mỹ, Singapore, FATF
references/crypto/          stablecoin, token, ví, KYC, tiếp thị
references/compare/         đối chiếu Việt Nam và quốc tế
references/penalties.md     mức phạt
sources/legal-references.md văn bản, link, ngày hiệu lực, trạng thái
scripts/                    scan.sh, fetch-site.sh
tests/                      dự án mẫu, tên thư mục ghi kết quả mong đợi
tools/                      sync.sh, check-sources.sh, stats.sh
DECISIONS.md                các quyết định đã đưa ra
```

## Sửa repo

```bash
bash tools/sync.sh            # sinh file rules từ AGENTS.md
bash tools/check-sources.sh   # mỗi mục có nguồn hoặc cờ
bash tools/stats.sh           # cập nhật thống kê
bash tests/run.sh             # test scan.sh
```

Phát hiện sai? Rất mong được góp ý, kèm link văn bản gốc.

## Ghi công

Cấu trúc và cách làm học từ [mhfed/vn-law-check](https://github.com/mhfed/vn-law-check) (MIT): triage trước checklist, báo cáo rút gọn, scan có bằng chứng, file `sync.sh` và `install.sh`. Nội dung checklist và script ở đây được viết lại. Repo này phát hành theo [MIT](LICENSE).
