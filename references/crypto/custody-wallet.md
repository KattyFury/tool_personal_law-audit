# Crypto: ví và giữ tiền hộ

Câu hỏi quan trọng nhất: **ai có khả năng di chuyển tiền của người dùng mà không cần người dùng ký?** Nếu câu trả lời là dự án, coi như có custody, dù marketing viết "non-custodial". Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

## Kiểm tra trong code

- [ ] Backend tạo hoặc lưu private key, seed phrase của người dùng (`CUSTODY`): coi như custody. [US-FINCEN] [EU-MICA]
- [ ] Ví do lập trình viên kiểm soát (ví dụ Circle developer-controlled wallets): dự án giữ quyền. Ví người dùng kiểm soát, passkey trên thiết bị người dùng: thường là non-custodial, vẫn cần kiểm tra quyền khôi phục. [US-FINCEN]
- [ ] Contract có hàm admin rút hoặc chuyển tiền người dùng, nâng cấp được bằng khóa đơn: nêu rõ trong báo cáo. FinCEN xét theo quyền kiểm soát độc lập với giá trị, không xét theo cái tên. [US-FINCEN]
- [ ] Multi-sig mà dự án giữ đủ chữ ký để tự chuyển: giống ví có lưu ký. Mới đọc tóm tắt phần multi-sig của FinCEN: CHƯA XÁC MINH. [US-FINCEN]
- [ ] Session key, AI agent giao dịch thay: phạm vi quyền, hạn mức, khả năng thu hồi có rõ không. Chưa có quy định riêng. CHƯA XÁC MINH

## Theo khu vực

- [ ] **Mỹ, ví không lưu ký:** người dùng tự giao dịch cho mình không phải money transmitter (FinCEN mục 4.2). [US-FINCEN]
- [ ] **Mỹ, DApp:** khi DApp thực hiện chuyển tiền, định nghĩa money transmitter áp dụng cho DApp, chủ sở hữu hoặc người vận hành, không kể có lợi nhuận hay không (FinCEN mục 4.4). Hướng dẫn năm 2019, đừng coi "phi tập trung" là miễn trừ tự động. [US-FINCEN]
- [ ] **Mỹ, GENIUS:** yêu cầu bảo quản ở §10 không áp cho bên chỉ cung cấp phần cứng, phần mềm để khách tự lưu ký (§10(e)). [US-GENIUS]
- [ ] **EU:** giữ tiền hộ là dịch vụ crypto-asset (Art. 3(1)(16) điểm a), cần giấy phép (Art. 59), có hợp đồng với khách (Art. 75). Không có giấy phép từ sau 01/07/2026 thì hết chuyển tiếp (Art. 143(3)). [EU-MICA]
- [ ] **EU:** chỉ khi "hoàn toàn phi tập trung, không có trung gian" mới ngoài phạm vi (Recital 22). Một phần phi tập trung vẫn trong phạm vi. [EU-MICA]
- [ ] **Việt Nam:** nhận lưu trữ, bảo quản, chuyển giao tài sản hộ là "lưu ký" (khoản 6 Điều 3 NQ 05), cần giấy phép (khoản 3 Điều 3, khoản 4 Điều 4). Nếu đã có giấy phép, không tách biệt tài sản khách bị phạt 100-150 triệu (khoản 6 Điều 8 NĐ 284). [VN-NQ05] [VN-ND284]
- [ ] **Việt Nam, non-custodial:** chưa có quy định rõ. Không ghi 🟢. CHƯA XÁC MINH
- [ ] **Singapore:** DTSP loại trừ nhà cung cấp kỹ thuật không giữ tiền hay token, theo công ty luật. CHƯA XÁC MINH [SG-FSMA]

## Điều khoản và giao diện

- [ ] Điều khoản phải nói đúng thực tế: ai giữ khóa, mất khóa thì sao, ai có quyền dừng. Nói "chúng tôi không bao giờ chạm tiền của bạn" mà contract có quyền admin là thông tin sai. [EU-MICA] [VN-NQ05]
- [ ] Có khóa quản trị: công khai ai giữ, timelock bao lâu. Đây là khuyến nghị giảm rủi ro, không phải yêu cầu của điều luật cụ thể. CHƯA XÁC MINH
- [ ] Lập trình viên không lưu mật khẩu hoặc seed trong log, analytics. [VN-PDPL] [EU-GDPR]
