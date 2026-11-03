# Việt Nam: dữ liệu cá nhân

Căn cứ chính: Luật 91/2025/QH15, hiệu lực 01/01/2026. Nghị định 13/2023 là văn bản cũ, thấy tài liệu còn dẫn thì cảnh báo cập nhật. Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

**Ví dApp có phải dữ liệu cá nhân không?** Khoản 1 Điều 2 định nghĩa là dữ liệu "xác định hoặc giúp xác định một con người cụ thể". Địa chỉ ví đi cùng email, IP, tên X, tên miền ENS thì giúp xác định được. Địa chỉ ví đứng một mình: CHƯA XÁC MINH, cứ coi là dữ liệu cá nhân khi lập chính sách cho an toàn.

## Miễn trừ cho đơn vị nhỏ

Điều 38 Luật 91, nghĩa vụ liên quan: Điều 21, Điều 22, khoản 2 Điều 33.

- [ ] Hộ kinh doanh, doanh nghiệp siêu nhỏ không phải thực hiện các nghĩa vụ trên (khoản 3). [VN-PDPL]
- [ ] Doanh nghiệp nhỏ, khởi nghiệp được chọn chưa thực hiện trong 5 năm từ ngày luật có hiệu lực (khoản 2). [VN-PDPL]
- [ ] Không được miễn nếu kinh doanh dịch vụ xử lý dữ liệu, trực tiếp xử lý dữ liệu nhạy cảm, hoặc xử lý dữ liệu số lượng lớn. Dự án KYC thường rơi vào nhóm này. [VN-PDPL]
- [ ] Danh mục dữ liệu nhạy cảm có gồm tài khoản ngân hàng, hành vi trực tuyến theo NĐ 356: CHƯA XÁC MINH. [VN-ND356]

## A. Chính sách và minh bạch

- [ ] Có trang chính sách dễ tìm, nêu loại dữ liệu, mục đích, bên kiểm soát, quyền của người dùng. Đây là các thông tin người dùng phải biết rõ để đồng ý có hiệu lực (khoản 2 Điều 9). [VN-PDPL]
- [ ] Không còn dẫn NĐ 13/2023 làm căn cứ chính. Ngày hết hiệu lực theo nguồn thứ cấp: CHƯA XÁC MINH. [VN-ND13]
- [ ] Có kênh yêu cầu xem, sửa, xóa, rút đồng ý. Thời hạn xử lý theo NĐ 356: CHƯA XÁC MINH. [VN-ND356]

## B. Đồng ý

- [ ] Đồng ý theo từng mục đích, không kèm điều kiện phải đồng ý mục đích khác (điểm a, b khoản 4 Điều 9). [VN-PDPL]
- [ ] Không coi im lặng hoặc không phản hồi là đồng ý (điểm d khoản 4 Điều 9). Câu "tiếp tục sử dụng là đồng ý" và "kết nối ví là đồng ý thu thập dữ liệu" đều đáng cảnh báo. [VN-PDPL]
- [ ] Đồng ý có thể in, sao chép, kiểm chứng được (khoản 3 Điều 9). Cần lưu thời điểm và nội dung. [VN-PDPL]
- [ ] Trường hợp không cần đồng ý chỉ theo Điều 19. Đừng tự suy ra "lợi ích hợp pháp" như GDPR. [VN-PDPL]
- [ ] Trẻ em: người đại diện theo pháp luật thực hiện thay theo Điều 24. Độ tuổi cụ thể khi nào cần cả trẻ đồng ý: CHƯA XÁC MINH. [VN-PDPL]

## C. Cookie và theo dõi

Chưa thấy điều riêng về cookie trong các điều đã đọc. CHƯA XÁC MINH.

- [ ] Xử lý dữ liệu khách hàng để kinh doanh quảng cáo phải được khách hàng đồng ý, có cách từ chối (khoản 3 Điều 28). Áp vào pixel quảng cáo của chính website thế nào: đọc thêm Điều 28 và NĐ 356. [VN-PDPL]
- [ ] Nạp analytics, pixel sau khi người dùng đồng ý là cách làm an toàn. Bộ theo dõi nối được với địa chỉ ví cần cảnh báo riêng. [VN-PDPL]

## D. Chuyển dữ liệu ra nước ngoài

Xem phần miễn trừ trước.

- [ ] Chuyển dữ liệu xuyên biên giới gồm cả việc **dùng nền tảng ngoài Việt Nam để xử lý dữ liệu thu thập tại Việt Nam** (điểm c khoản 1 Điều 20). Vercel, Cloudflare, Firebase, Supabase, API AI nước ngoài đều cần xem xét. [VN-PDPL]
- [ ] Lập hồ sơ đánh giá tác động và gửi 1 bản chính trong 60 ngày từ lần chuyển đầu tiên, trừ khoản 6 (khoản 2 Điều 20). [VN-PDPL]
- [ ] Mẫu hồ sơ, thủ tục thông báo theo NĐ 356: CHƯA XÁC MINH. [VN-ND356]

## E. Tổ chức nội bộ và sự cố

- [ ] Đánh giá tác động xử lý dữ liệu (Điều 21). Chi tiết hồ sơ chưa đọc: CHƯA XÁC MINH. [VN-PDPL]
- [ ] Chỉ định bộ phận, nhân sự đủ năng lực, hoặc thuê dịch vụ bảo vệ dữ liệu (khoản 2 Điều 33). [VN-PDPL]
- [ ] Có quy trình thông báo vi phạm cho cơ quan chuyên trách chậm nhất 72 giờ từ khi phát hiện (khoản 1 Điều 23). Bên xử lý phải báo kịp thời cho bên kiểm soát. [VN-PDPL]

## F. Hành vi bị cấm

- [ ] Không mua, bán dữ liệu cá nhân, trừ khi luật quy định khác (khoản 6 Điều 7). Mua danh sách ví kèm email cho airdrop thuộc diện cảnh báo. [VN-PDPL]
- [ ] Không chiếm đoạt, cố ý làm lộ, làm mất dữ liệu (khoản 7 Điều 7). [VN-PDPL]
- [ ] Không dùng dữ liệu người khác trái quy định (khoản 5 Điều 7). [VN-PDPL]

## Lưu trữ dữ liệu tại Việt Nam

- [ ] Doanh nghiệp nước ngoài có thể bị Bộ trưởng Bộ Công an yêu cầu lưu trữ dữ liệu, đặt chi nhánh hoặc văn phòng đại diện. Hình thức lưu trữ do doanh nghiệp quyết định, phải truy xuất được khi có yêu cầu. Số điều và điều kiện: CHƯA XÁC MINH. [VN-ND333]
- [ ] Nghĩa vụ chung trong Luật An ninh mạng 2025: CHƯA XÁC MINH. [VN-CS]
