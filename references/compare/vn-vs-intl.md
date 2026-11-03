# Đối chiếu Việt Nam và quốc tế

Dùng cho mục "Xung đột Việt Nam vs quốc tế" trong báo cáo, khi dự án có từ 2 khu vực trở lên. Nguyên tắc chung: lấy yêu cầu chặt hơn nếu được, ghi rõ chỗ không thể cùng thỏa mãn. Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

## Dữ liệu cá nhân

| Vấn đề | Việt Nam | EU | Mỹ (California) | Singapore | Hệ quả khi thiết kế |
|---|---|---|---|---|---|
| Căn cứ xử lý | Đồng ý theo từng mục đích, ngoại lệ ở Điều 19 [VN-PDPL] | Có nhiều căn cứ, chi tiết Art. 6: CHƯA XÁC MINH | Mô hình từ chối, quyền Do Not Sell [US-CCPA] | CHƯA XÁC MINH [SG-PDPA] | Đừng chép chính sách GDPR dùng "lợi ích hợp pháp" sang Việt Nam |
| Im lặng | Không phải đồng ý, điểm d khoản 4 Điều 9 [VN-PDPL] | Cùng hướng, CHƯA XÁC MINH | Khác mô hình | CHƯA XÁC MINH | Dùng lựa chọn chủ động |
| Thông báo sự cố | 72 giờ, Điều 23 [VN-PDPL] | 72 giờ nếu khả thi, Art. 33 [EU-GDPR] | CHƯA XÁC MINH | CHƯA XÁC MINH [SG-PDPA] | Quy trình chung 72 giờ, Việt Nam không có chữ "nếu khả thi" trong đoạn đã đọc |
| Chuyển ra nước ngoài | Hồ sơ gửi cơ quan trong 60 ngày, gồm cả dùng nền tảng nước ngoài, Điều 20 [VN-PDPL] | Chương V: CHƯA XÁC MINH | Không có cơ chế tương tự trong phần đã đọc | CHƯA XÁC MINH [SG-PDPA] | **Khác lớn:** host ở Mỹ có thể đủ điều kiện ở EU nhưng vẫn cần hồ sơ ở Việt Nam |
| Cookie | Chưa thấy điều riêng, CHƯA XÁC MINH | Đồng ý trước, Art. 5(3) [EU-EPR] | Quyền từ chối [US-CCPA] | CHƯA XÁC MINH | Làm theo EU là an toàn nhất |
| Trẻ em | Người đại diện thay mặt, Điều 24 [VN-PDPL] | 16 tuổi, nước thành viên có thể hạ, Art. 8 [EU-GDPR] | Dưới 13, COPPA [US-COPPA] | CHƯA XÁC MINH | Ghi tuổi tối thiểu cao nhất trong các khu vực |
| Mức phạt tối đa | 3 tỷ đồng, 5% doanh thu cho chuyển dữ liệu, Điều 8 [VN-PDPL] | 20 triệu EUR hoặc 4%, Art. 83(5) [EU-GDPR] | CHƯA XÁC MINH | CHƯA XÁC MINH | Xem `penalties.md` |

## Crypto

| Vấn đề | Việt Nam | EU | Mỹ | Singapore | Hệ quả |
|---|---|---|---|---|---|
| Dịch vụ crypto | Cần giấy phép Bộ Tài chính, khoản 4 Điều 4 [VN-NQ05] | Cần giấy phép CASP, Art. 59 [EU-MICA] | Money transmitter, cấp bang [US-FINCEN] | PS Act, FSMA [SG-PSA] [SG-FSMA] | Giấy phép một nơi không dùng được nơi khác |
| Non-custodial | Chưa có quy định rõ | Ngoài phạm vi nếu hoàn toàn phi tập trung, Recital 22 [EU-MICA] | Loại trừ trong GENIUS §2(7)(B) [US-GENIUS] | Loại trừ kỹ thuật, CHƯA XÁC MINH [SG-FSMA] | **Khác lớn:** loại trừ ở Mỹ không có giá trị ở Việt Nam |
| Quảng cáo | Chỉ bên có giấy phép, câu chữ rộng [VN-NQ05] [VN-ND284] | Được, nếu đúng Art. 7, 66 [EU-MICA] | Vướng chứng khoán, CHƯA XÁC MINH | Có điều cấm chào mời [SG-PSA] | **Xung đột thực tế:** nội dung hợp lệ ở EU vẫn có rủi ro nếu nhắm tới Việt Nam. Xem xét tách nội dung theo khu vực |
| Bán token cho dân địa phương | Không, chỉ cho nhà đầu tư nước ngoài, khoản 1 Điều 6 [VN-NQ05] | Được khi có white paper, Art. 4 [EU-MICA] | CHƯA XÁC MINH | CHƯA XÁC MINH | Ngược nhau: chặn Việt Nam trong đợt bán dù EU cho phép |
| Stablecoin nước ngoài | Không có đường phát hành, thanh toán còn chưa rõ [VN-NQ05] [VN-ND52] | Cần bên phát hành được phép, Art. 48 [EU-MICA] | Từ 18/07/2028 hạn chế chào bán, §3(b) [US-GENIUS] | Chưa có luật, CHƯA XÁC MINH [SG-SCS] | Kiểm tra từng đồng theo khu vực |
| Trừng phạt | Danh sách đen theo AML [VN-ND284] | CHƯA XÁC MINH | SDN, trách nhiệm nghiêm ngặt [US-OFAC] | CHƯA XÁC MINH | Sàng lọc theo danh sách chặt nhất có liên quan |
| Travel Rule | CHƯA XÁC MINH | Art. 14(1) quy định thông tin đi kèm, ngưỡng tối thiểu CHƯA XÁC MINH [EU-TFR] | CHƯA XÁC MINH | CHƯA XÁC MINH | Áp cho CASP, không áp cho phần mềm thuần |

## Xung đột không thể hòa giải bằng code

- Dữ liệu onchain không xóa được và quyền xóa [EU-GDPR]. Cách làm: không ghi dữ liệu cá nhân lên chain.
- Yêu cầu lưu trữ tại Việt Nam khi có quyết định và kiến trúc phân tán toàn cầu [VN-ND333]. Xem xét khi có yêu cầu thực tế.
- Yêu cầu giữ dữ liệu KYC theo AML và quyền xóa dữ liệu. Thời gian giữ cụ thể: CHƯA XÁC MINH.
