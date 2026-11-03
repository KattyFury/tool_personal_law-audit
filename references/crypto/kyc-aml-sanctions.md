# Crypto: KYC, AML, trừng phạt

Có 2 câu hỏi khác nhau. **Có bắt buộc làm KYC không** tùy dự án có phải đối tượng bị quản lý. **Có được phục vụ người bị trừng phạt không** thì gần như luôn là không với ai dính tới Mỹ. Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

## Trừng phạt

- [ ] OFAC áp trách nhiệm dân sự nghiêm ngặt: có thể bị phạt dù không biết (mục Strict Liability). Chương trình tuân thủ là yếu tố giảm nhẹ. Áp dụng với người Mỹ và giao dịch dính tới Mỹ. [US-OFAC]
- [ ] Hướng dẫn nhắm tới cả công ty công nghệ, nhà cung cấp ví. [US-OFAC]
- [ ] Có sàng lọc địa chỉ ví với danh sách SDN không (`SANCTIONS`)? Không có mà xử lý tiền hoặc có người dùng Mỹ: 🟡. Giữ tiền: 🔴. [US-OFAC]
- [ ] Có chặn địa lý theo IP cho khu vực bị cấm vận không? Hướng dẫn nêu ví dụ công ty có IP người dùng nhưng không dùng để sàng lọc. [US-OFAC]
- [ ] Tích hợp mixer hoặc giao thức từng bị trừng phạt: kiểm tra danh sách hiện hành. Tornado Cash đã được gỡ 21/03/2025 theo nguồn thứ cấp, nhưng một số cá nhân liên quan vẫn trong danh sách. Theo nguồn thứ cấp: CHƯA XÁC MINH. [US-TC]
- [ ] Danh sách trừng phạt của EU, Việt Nam, Singapore: bộ luật này chưa rà riêng. CHƯA XÁC MINH

## KYC và AML theo khu vực

- [ ] **Việt Nam:** tổ chức được cấp phép không nhận biết khách hàng, không cập nhật danh sách đen: phạt 100-120 triệu (khoản 1 Điều 13 NĐ 284). [VN-ND284]
- [ ] **Việt Nam:** Điều 4 Luật 14/2022 nêu đối tượng báo cáo là tổ chức tài chính được cấp phép. Dự án không có giấy phép có phải báo cáo không: chưa có quy định rõ. CHƯA XÁC MINH [VN-AML]
- [ ] **EU:** chỉ CASP mới chịu Travel Rule. Đi kèm chuyển khoản: tên, địa chỉ ví, số tài khoản, địa chỉ hoặc giấy tờ hoặc ngày sinh của người gửi (Art. 14(1)). [EU-TFR]
- [ ] **EU, ví tự lưu ký:** CASP phải thu thập thông tin, và với khoản trên 1.000 EUR phải có biện pháp đánh giá ví có thuộc khách hàng không (Art. 14(5), Recital 39). Giao thức không có CASP tham gia thì ngoài phạm vi này (Recital 38). [EU-TFR]
- [ ] **Mỹ:** money transmitter phải đăng ký và có chương trình AML theo Bank Secrecy Act. Xem `custody-wallet.md` để biết ai thuộc diện. [US-FINCEN]
- [ ] **Mỹ:** AML cho stablecoin trong GENIUS (§8, §9) áp cho bên phát hành, quy định của Bộ Tài chính chưa có bản cuối theo nguồn thứ cấp. CHƯA XÁC MINH [US-GENIUS]
- [ ] **Giao dịch ẩn danh:** FinCEN có mục riêng về giao dịch tăng cường ẩn danh (mục 4.5). Tính năng privacy, mixer cần xem xét kỹ. [US-FINCEN]
- [ ] **Chuẩn chung:** xem `intl/fatf.md`. Chưa đọc toàn văn: CHƯA XÁC MINH. [FATF-R15]

## Nếu dự án có KYC

- [ ] Giấy tờ, ảnh chân dung là dữ liệu nhạy cảm cao. Mất miễn trừ đơn vị nhỏ ở Việt Nam do xử lý dữ liệu nhạy cảm (Điều 38 Luật 91). Danh mục cụ thể trong NĐ 356: CHƯA XÁC MINH. [VN-PDPL] [VN-ND356]
- [ ] Dùng SDK KYC ở nước ngoài (Sumsub, Persona, Onfido...) là chuyển dữ liệu xuyên biên giới (điểm c khoản 1 Điều 20). [VN-PDPL]
- [ ] Không gắn dữ liệu KYC lên chain. Quyền xóa theo GDPR không thực hiện được trên dữ liệu đã ghi onchain (Art. 17). [EU-GDPR]
- [ ] Thời gian lưu dữ liệu KYC theo từng luật AML: CHƯA XÁC MINH.
