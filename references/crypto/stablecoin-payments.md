# Crypto: stablecoin và thanh toán

Phân biệt 3 vai trò, vì nghĩa vụ khác hẳn nhau: **phát hành**, **cung cấp dịch vụ** (bán, đổi, giữ hộ), **chỉ tích hợp** (người dùng tự ký chuyển USDC). Phần lớn dự án thuộc vai trò thứ ba. Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

## Phát hành stablecoin

Nếu định làm việc này, dừng lại và hỏi luật sư. Checklist chỉ để nhận ra.

- [ ] Mỹ: chỉ bên phát hành được phép mới được phát hành payment stablecoin ở Mỹ (§3(a)). [US-GENIUS]
- [ ] EU: chỉ tổ chức tín dụng hoặc tổ chức tiền điện tử mới được chào bán e-money token (Art. 48(1)). [EU-MICA]
- [ ] Việt Nam: NQ 05 loại tiền pháp định khỏi tài sản cơ sở (khoản 2 Điều 5). [VN-NQ05]
- [ ] Singapore: giấy phép phát hành stablecoin mới ở dự thảo. CHƯA XÁC MINH [SG-SCS]

## Cung cấp dịch vụ stablecoin

- [ ] Mỹ: từ 3 năm sau ngày ban hành (18/07/2028), nhà cung cấp dịch vụ tài sản số không được chào bán payment stablecoin cho người ở Mỹ nếu bên phát hành không được phép (§3(b)(1)). Tính ngày theo 18/07/2025. [US-GENIUS]
- [ ] Mỹ: định nghĩa nhà cung cấp dịch vụ **không gồm** giao thức, phần mềm tự lưu ký, người vận hành validator, người cấp thanh khoản (§2(7)(B)). Điều này chỉ trong phạm vi GENIUS, không miễn các luật khác. [US-GENIUS]
- [ ] Mỹ: §3 không áp dụng cho giao dịch trực tiếp giữa 2 cá nhân tự làm, hoặc qua ví giúp cá nhân tự lưu ký (§3(h)(1)). [US-GENIUS]
- [ ] Mỹ: GENIUS có hiệu lực sớm hơn giữa 18/01/2027 và 120 ngày sau quy định cuối cùng (§20). Quy định của OCC ban hành 21/10/2026 theo nguồn thứ cấp, hiệu lực 18/01/2027. [US-GENIUS] [US-OCC]
- [ ] EU: đổi stablecoin lấy tiền, giữ hộ, chuyển hộ là dịch vụ crypto-asset (Art. 3(1)(16)), cần giấy phép CASP (Art. 59). [EU-MICA]
- [ ] EU: stablecoin không tuân thủ MiCA: danh sách cụ thể và cách sàn xử lý: CHƯA XÁC MINH. [EU-ESMA]
- [ ] Singapore: dịch vụ token thanh toán cần giấy phép theo s 5 PS Act. Mới đọc mục lục, phạm vi chi tiết: CHƯA XÁC MINH. [SG-PSA]

## Nhận thanh toán bằng stablecoin

- [ ] Việt Nam: bán hàng cho người Việt, nhận USDC, USDT: 🔴. Điều 8 khoản 6 NĐ 52 cấm dùng phương tiện thanh toán không hợp pháp. Bản đã đọc không nhắc đích danh stablecoin nên chưa kết luận chắc. CHƯA XÁC MINH [VN-ND52] [VN-CRYPTOPAY]
- [ ] Mỹ: mua hàng hóa, dịch vụ cho chính mình bằng ví không lưu ký thì người mua không phải money transmitter (FinCEN mục 4.2). Bên trung gian nhận hộ rồi chuyển đi là chuyện khác. [US-FINCEN]
- [ ] Ở mọi nơi: nhận từ ví bị trừng phạt: xem `kyc-aml-sanctions.md`. [US-OFAC]

## Nối fiat

- [ ] Có on-ramp, off-ramp tự vận hành: thường cần giấy phép ở mọi khu vực. Việt Nam xem điều cấm ở khoản 7 Điều 8 NĐ 52. [VN-ND52]
- [ ] Nhúng widget của bên thứ ba có giấy phép (MoonPay, Transak, Circle...): rủi ro thấp hơn. Giấy phép của bên đó có phủ khu vực của người dùng không phải tự kiểm tra, không kết luận từ code. CHƯA XÁC MINH

## Lãi và lợi suất

- [ ] Bên phát hành không được trả lãi cho người giữ payment stablecoin theo GENIUS. Câu chữ §4 chưa đọc lại đầy đủ: CHƯA XÁC MINH. [US-GENIUS]
- [ ] Nói "stablecoin an toàn như tiền gửi", "lãi cố định": xem `marketing-crypto.md`. [EU-MICA]
