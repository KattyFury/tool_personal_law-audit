# Crypto: phát hành token, NFT

Chỉ tích hợp token có sẵn thì bỏ qua file này. Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

## Xác định loại token

- [ ] Token neo một loại tiền pháp định: xem `stablecoin-payments.md`. [EU-MICA] [US-GENIUS]
- [ ] NFT độc nhất, không thay thế được: MiCA không áp dụng theo Recital 10 và Art. 2. NFT phát hành hàng loạt có thể không được coi là độc nhất. Ngưỡng cụ thể chưa đọc: CHƯA XÁC MINH. [EU-MICA]
- [ ] Token tiện ích, governance, memecoin: thuộc Title II MiCA nếu chào bán công khai ở EU. [EU-MICA]
- [ ] Ở Việt Nam: xem `vn/digital-assets.md` mục C. Token theo NQ 05 phải dựa trên tài sản thực, chỉ chào bán cho nhà đầu tư nước ngoài. [VN-NQ05]

## Chào bán công khai ở EU

- [ ] Cần là pháp nhân, có white paper, thông báo, công bố (Art. 4(1)). Người bán là cá nhân: 🔴. [EU-MICA]
- [ ] Miễn white paper nếu dưới 150 người mỗi nước thành viên, hoặc tổng dưới 1 triệu EUR trong 12 tháng, hoặc chỉ cho nhà đầu tư đủ điều kiện (Art. 4(2)). Vẫn còn các nghĩa vụ khác. [EU-MICA]
- [ ] Chào bán đã kết thúc trước 30/12/2024 không chịu Art. 4-15 (Art. 143(1)). [EU-MICA]
- [ ] Token không có bên phát hành xác định được: ngoài phạm vi Title II, III, IV (Recital 22). Có đội ngũ, foundation, khóa quản trị thì khó dùng lập luận này. [EU-MICA]

## Smart contract: quyền đặc biệt

`scan.sh` báo `SC_PRIVILEGED` khi thấy `mint`, `pause`, `blacklist`, `upgradeTo`, `onlyOwner`...

- [ ] Hàm `mint` không giới hạn: phải nêu trong white paper, tokenomics. Nói "nguồn cung cố định" mà còn `mint` là thông tin gây hiểu lầm. [EU-MICA] [VN-ND284]
- [ ] `pause`, `blacklist`, nâng cấp contract: chứng tỏ có người kiểm soát, làm yếu lập luận "hoàn toàn phi tập trung" (Recital 22). [EU-MICA]
- [ ] Hàm cho admin rút tiền người dùng: xem `custody-wallet.md`. [US-FINCEN]
- [ ] Có khả năng đóng băng theo yêu cầu cơ quan có thẩm quyền: GENIUS yêu cầu năng lực này ở bên phát hành stablecoin nước ngoài (§3(b)(2)). Với token khác không bắt buộc. [US-GENIUS]

## Mỹ, Singapore

- [ ] Token có thể bị coi là chứng khoán tại Mỹ. Bộ luật này chưa rà, CLARITY Act chưa thành luật. Có người mua ở Mỹ: hỏi luật sư. CHƯA XÁC MINH
- [ ] Doanh nghiệp từ Singapore phục vụ khách ở nước ngoài về token có thể cần giấy phép DTSP (s 137 FSMA, Part 9). Nội dung qua công ty luật: CHƯA XÁC MINH. [SG-FSMA]
