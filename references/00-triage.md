# Bước 0: Dự án này chịu luật nào?

Làm bước này trước mọi checklist. Mục tiêu: dApp giữ tiền người dùng được rà kỹ, còn blog không bị ép đọc 10 bảng ⚪.

**Tự trả lời từ code hoặc URL.** Chạy `bash scripts/scan.sh <thư-mục-hoặc-URL>`, đọc lại bằng chứng file:dòng. Script chỉ grep nên có thể bắt nhầm. Chỉ hỏi người dùng khi code không thể trả lời, thường là câu 1 và câu 3.

## 9 câu hỏi

| # | Câu hỏi | Tìm ở đâu | Tín hiệu scan.sh |
|---|---|---|---|
| 1 | Người dùng ở đâu: VN, EU, Mỹ, Singapore? | Ngôn ngữ giao diện, tiền tệ, tên miền, chặn địa lý, điều khoản | `REGION_*` |
| 2 | Có thu dữ liệu cá nhân, cookie, tracking, đăng nhập, form không? | Form, analytics, auth | `FORM`, `TRACKING`, `AUTH`, `COOKIE_BANNER`, `POLICY` |
| 3 | Có kết nối ví không? Giữ tiền hộ hay non-custodial? | wagmi, ethers, SDK ví, nơi lưu khóa | `WALLET`, `CUSTODY` |
| 4 | Có phát hành token, NFT, stablecoin, hay chỉ tích hợp token có sẵn? | File `.sol`, script deploy, trang tokenomics | `TOKEN_ISSUE`, `SC_PRIVILEGED` |
| 5 | Có thanh toán, chuyển tiền, đổi tiền, thu phí không? | Swap, bridge, on-ramp, cổng thanh toán, phí | `PAYMENT`, `SWAP` |
| 6 | Có KYC/AML, sàng lọc trừng phạt không? | SDK KYC, API sàng lọc địa chỉ | `KYC`, `SANCTIONS` |
| 7 | Có quảng cáo, referral, khuyến mãi, tiếp thị về crypto không? | Landing, airdrop, cam kết lợi nhuận | `CRYPTO_PROMO` |
| 8 | Có AI/chatbot tương tác với người dùng không? | API AI, widget chat | `AI` |
| 9 | Có nhắm tới trẻ em không? | Nội dung, độ tuổi, cổng tuổi | Không có tín hiệu tự động, xem nội dung |

**Không kết luận non-custodial chỉ vì code có kết nối ví.** Kiểm tra thêm: backend có giữ khóa không, có khóa quản trị rút được tiền không, có ví do lập trình viên kiểm soát không.

## Bốn loại dự án

| Loại | Dấu hiệu | Cách báo cáo |
|---|---|---|
| **A. Tĩnh** | Không form, không tracking, không ví | Một dòng kết luận, kèm "rà lại khi thêm form, tracking, ví" |
| **B. Web/app thường** | Có form, tài khoản, bán hàng, chatbot, không crypto | Theo ma trận, cột không crypto |
| **C. Onchain non-custodial** | Có ví, người dùng tự ký, không giữ khóa | Đủ ma trận, đặc biệt mục quảng cáo |
| **D. Giữ tiền hoặc phát hành** | Giữ khóa, phát hành token/stablecoin, chuyển đổi fiat | Đủ ma trận, nêu nguy cơ cần giấy phép trước tiên |

## Ma trận lĩnh vực × khu vực

Chỉ mở các ô áp dụng. Khu vực không có người dùng thì bỏ cả cột. `—` nghĩa là không có checklist riêng.

| Lĩnh vực | Khi nào áp dụng | Việt Nam | EU | Mỹ | Singapore |
|---|---|---|---|---|---|
| Dữ liệu cá nhân | Có form, tracking, đăng nhập | `vn/personal-data.md` | `intl/eu.md` mục A | `intl/us.md` mục A | `intl/sg.md` mục A |
| Cookie, tracking | Có analytics, pixel | `vn/personal-data.md` mục C | `intl/eu.md` mục B | `intl/us.md` mục A | `intl/sg.md` mục A |
| Tài sản số, sàn | Có swap, sàn, dịch vụ crypto | `vn/digital-assets.md` | `intl/eu.md` mục C | `intl/us.md` mục C | `intl/sg.md` mục B |
| Phát hành token | Có `TOKEN_ISSUE` | `crypto/token-issuance.md` | như cột VN | như cột VN | như cột VN |
| Stablecoin, thanh toán | Có `PAYMENT`, nhận hoặc chuyển stablecoin | `crypto/stablecoin-payments.md` | như cột VN | như cột VN | như cột VN |
| Giữ tiền, ví | Có `WALLET` hoặc `CUSTODY` | `crypto/custody-wallet.md` | như cột VN | như cột VN | như cột VN |
| KYC, AML, trừng phạt | Giữ tiền, chuyển đổi, hoặc có người dùng Mỹ | `crypto/kyc-aml-sanctions.md` | như cột VN | như cột VN | như cột VN |
| Quảng cáo crypto | Có `CRYPTO_PROMO` | `crypto/marketing-crypto.md` | như cột VN | như cột VN | như cột VN |
| AI, chatbot | Có `AI` | `vn/other.md` mục C | `intl/eu.md` mục D | — | — |
| Trẻ em | Nhắm tới trẻ em | `vn/personal-data.md` mục B | `intl/eu.md` mục A | `intl/us.md` mục B | — |
| Bán hàng, người tiêu dùng | Có giỏ hàng, bán dịch vụ | `vn/other.md` mục A | — | — | — |
| Chuẩn xuyên quốc gia | Giữ tiền hoặc chuyển tiền hộ | — | `intl/fatf.md` | `intl/fatf.md` | `intl/fatf.md` |

Khi có từ 2 khu vực trở lên, mở thêm `compare/vn-vs-intl.md`. Khi nêu mức phạt, mở `penalties.md`.

## Xác định khu vực khi không ai nói

| Dấu hiệu | Kết luận tạm |
|---|---|
| Giao diện tiếng Việt, VND, `.vn`, cổng VNPay/Momo | Có người dùng VN |
| Tiếng Đức/Pháp/Tây Ban Nha..., EUR, `.eu`, đề cập GDPR | Có người dùng EU |
| USD, "US residents", dịch vụ nhắm vào Mỹ | Có người dùng Mỹ |
| SGD, `.sg`, PayNow | Có người dùng Singapore |
| Chỉ tiếng Anh, không chặn địa lý, dApp công khai | **Coi là toàn cầu:** rà VN nếu đội ngũ ở VN, cộng EU và Mỹ. Ghi rõ đây là giả định |

Chặn IP Mỹ trong code không đủ để kết luận "không có người dùng Mỹ". Ghi nó như một biện pháp giảm rủi ro, không phải lý do bỏ qua.

## Khi nào được báo một dòng

Chỉ khi `scan.sh` báo `TYPE=A` và đọc lại bằng chứng không có gì khác:

> **Rà soát pháp lý: ten-du-an** (ngày). Trang tĩnh, không thu dữ liệu, không ví, không tracking, nên chưa thấy nghĩa vụ đáng kể trong phạm vi bộ luật này. Rà lại khi thêm form, tracking, kết nối ví hoặc nội dung quảng cáo token. *Đây là rà soát ban đầu, không phải tư vấn pháp lý.*

Lưu ý: một trang tĩnh **có nội dung quảng cáo token** không phải loại A. `CRYPTO_PROMO` đưa nó sang loại C.
