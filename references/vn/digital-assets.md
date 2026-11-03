# Việt Nam: tài sản số, tài sản mã hóa, thanh toán, chống rửa tiền

Áp dụng khi dự án có người dùng hoặc đội ngũ ở Việt Nam và đụng tới crypto. Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

## Hiện trạng trong 5 dòng

- Luật công nhận tài sản số là tài sản và có khái niệm tài sản mã hóa (Điều 46, 47 Luật 71/2025).
- Thị trường đang chạy theo thí điểm 5 năm từ 09/09/2025 (NQ 05/2025).
- Dịch vụ tài sản mã hóa cần giấy phép của Bộ Tài chính. Mức phạt riêng có từ 01/09/2026 (NĐ 284/2026).
- Tài sản mã hóa theo NQ 05 chỉ được chào bán, phát hành cho nhà đầu tư nước ngoài (khoản 1 Điều 6).
- Chưa có quy định rõ cho dApp non-custodial, smart contract công khai, DeFi, NFT. Đừng suy diễn theo chiều nào.

## A. Dự án có đang cung cấp "dịch vụ tài sản mã hóa" không?

Khoản 3 Điều 3 NQ 05 kể 4 hoạt động: tổ chức thị trường giao dịch, tự doanh, lưu ký, cung cấp nền tảng phát hành.

- [ ] Có sổ lệnh, ghép lệnh, hoặc nền tảng mua bán tài sản mã hóa do dự án vận hành không? Nếu có, đây là nguy cơ thuộc "tổ chức thị trường giao dịch". [VN-NQ05]
- [ ] Có nhận lưu trữ, bảo quản, chuyển giao tài sản hộ khách không? Nếu có, đối chiếu định nghĩa "lưu ký" ở khoản 6 Điều 3. [VN-NQ05]
- [ ] Có nền tảng cho người khác phát hành token không (launchpad, token factory)? Đối chiếu "nền tảng phát hành". [VN-NQ05]
- [ ] Có dùng vốn dự án mua bán với người dùng không (market maker, OTC)? Đối chiếu "tự doanh". [VN-NQ05]
- [ ] Khoản 4 Điều 4 NQ 05 ghi: chỉ tổ chức được Bộ Tài chính cấp phép mới được cung cấp dịch vụ liên quan đến tài sản mã hóa và quảng cáo, tiếp thị liên quan đến tài sản mã hóa. [VN-NQ05]
- [ ] Nếu có một trong các hoạt động trên mà chưa có giấy phép: 🔴. Mức phạt 180-200 triệu với tổ chức, cá nhân bằng một nửa (khoản 2 Điều 4), kèm tịch thu tang vật, nộp lại lợi bất hợp pháp, buộc gỡ website và hệ thống (điểm a khoản 4, điểm b khoản 5, khoản 6 Điều 7). [VN-ND284]
- [ ] Dự án chỉ là giao diện cho smart contract công khai, người dùng tự ký: chưa có quy định rõ. Ghi 🟡 kèm "hỏi luật sư", không ghi 🟢. CHƯA XÁC MINH

## B. Mốc thời gian dễ viết sai

- [ ] Nhà đầu tư trong nước giao dịch ngoài tổ chức được cấp phép sẽ bị xử lý **sau 6 tháng kể từ khi tổ chức đầu tiên được cấp phép** (khoản 2 Điều 7 NQ 05). Không viết "từ 01/09/2026". [VN-NQ05]
- [ ] NĐ 284 có hiệu lực 01/09/2026 và mức phạt 30-50 triệu dẫn chiếu đúng khoản 2 Điều 7 NQ 05 (khoản 1 Điều 9). [VN-ND284]
- [ ] Đã có tổ chức nào được cấp phép chưa, từ ngày nào: phải kiểm tra lại khi audit. CHƯA XÁC MINH [VN-LIC]
- [ ] Giao diện có hướng dẫn hoặc khuyến khích người dùng Việt Nam giao dịch qua sàn không phép không? Nếu có: 🟡, xem thêm `crypto/marketing-crypto.md`. [VN-NQ05]

## C. Phát hành và chào bán token

- [ ] Có chào bán token cho người dùng Việt Nam không? Tài sản mã hóa theo NQ 05 chỉ được chào bán, phát hành cho nhà đầu tư nước ngoài (khoản 1 Điều 6). Nhà đầu tư trong nước giao dịch loại này bị phạt 70-100 triệu (khoản 2 Điều 9 NĐ 284). [VN-NQ05] [VN-ND284]
- [ ] Tổ chức phát hành phải là doanh nghiệp Việt Nam dạng TNHH hoặc cổ phần, token phải dựa trên tài sản thực, không gồm chứng khoán, tiền pháp định (khoản 1, 2 Điều 5 NQ 05). Theo đó, stablecoin neo tiền pháp định không đi được đường này. [VN-NQ05]
- [ ] Chào bán sai đối tượng, không đủ điều kiện, không công bố bản cáo bạch: phạt 150-200 triệu với tổ chức phát hành (khoản 3 Điều 6). [VN-ND284]
- [ ] Token phát hành bởi tổ chức nước ngoài, không qua NQ 05, có người Việt mua: chưa có quy định rõ. CHƯA XÁC MINH
- [ ] NFT sưu tầm, điểm thưởng, token trong game: Điều 47 Luật 71 có nhóm "tài sản ảo" và "tài sản số khác". Áp vào từng loại cụ thể ra sao: CHƯA XÁC MINH. [VN-L71]

## D. Stablecoin và thanh toán

- [ ] Có nhận stablecoin hoặc crypto để thanh toán hàng hóa, dịch vụ ở Việt Nam không? Điều 8 khoản 6 NĐ 52/2024 cấm phát hành, cung ứng, sử dụng "phương tiện thanh toán không hợp pháp". Bản đã đọc không nhắc đích danh tiền ảo. Có áp vào stablecoin hay không và mức phạt: CHƯA XÁC MINH. Vẫn ghi 🔴 vì rủi ro cao. [VN-ND52] [VN-CRYPTOPAY]
- [ ] Có làm trung gian chuyển tiền VND, ví điện tử, thu hộ chi hộ không? Điều 8 khoản 7 NĐ 52 cấm cung ứng dịch vụ trung gian thanh toán khi chưa có giấy phép của Ngân hàng Nhà nước. [VN-ND52]
- [ ] Có cổng đổi VND sang crypto không? Kết hợp mục A và mục này, thường là 🔴.  [VN-NQ05] [VN-ND52]

## E. Chống rửa tiền

- [ ] Khoản 5 Điều 4 NQ 05 yêu cầu tổ chức, cá nhân tham gia thị trường tài sản mã hóa tuân thủ pháp luật chống rửa tiền, giao dịch điện tử, an ninh mạng, bảo vệ dữ liệu. [VN-NQ05]
- [ ] Điều 4 Luật 14/2022 liệt kê đối tượng báo cáo là tổ chức tài chính được cấp phép. Bản đã đọc không có cụm "tài sản ảo". Không viết rằng dự án crypto nhỏ "đương nhiên" là đối tượng báo cáo. Có bản sửa đổi nào chưa: CHƯA XÁC MINH. [VN-AML]
- [ ] Không nhận biết khách hàng, không cập nhật danh sách đen: phạt 100-120 triệu (khoản 1 Điều 13 NĐ 284). Các khoản sau của Điều 13 chưa đọc trực tiếp: CHƯA XÁC MINH. [VN-ND284]

## F. Dữ liệu tài khoản crypto

- [ ] Có thu thập, lưu giữ, mua bán, công khai trái phép dữ liệu, thông tin tài khoản tài sản mã hóa không? Phạt 150-200 triệu, đình chỉ giao dịch 1-3 tháng, nộp lại lợi bất hợp pháp (Điều 11 NĐ 284). [VN-ND284]
- [ ] Bán danh sách ví kèm danh tính, chia sẻ danh sách whitelist kèm email, công khai ví gắn tên thật: 🔴 nếu có. Câu chữ "tài khoản tài sản mã hóa" có bao gồm ví tự lưu ký hay không: CHƯA XÁC MINH. [VN-ND284]
