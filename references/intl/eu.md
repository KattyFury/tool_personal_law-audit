# EU

Áp dụng khi có người dùng ở EU, kể cả khi công ty không ở EU. Mã trong ngoặc vuông tra ở `sources/legal-references.md`.

## A. GDPR

- [ ] Áp dụng cho bên ngoài EU nếu cung cấp hàng hóa, dịch vụ cho người ở EU (kể cả miễn phí) hoặc theo dõi hành vi của họ (Art. 3(2)). [EU-GDPR]
- [ ] Bên ngoài EU thuộc Art. 3(2) phải chỉ định đại diện tại EU bằng văn bản, trừ ngoại lệ (Art. 27). [EU-GDPR]
- [ ] Sự cố dữ liệu: báo cơ quan giám sát không chậm trễ, nếu khả thi trong 72 giờ từ khi biết (Art. 33(1)). [EU-GDPR]
- [ ] Trẻ em: dịch vụ trực tuyến trực tiếp cho trẻ dựa trên đồng ý cần từ đủ 16 tuổi, dưới đó cần người giám hộ (Art. 8(1)). Nước thành viên có thể hạ tuổi. [EU-GDPR]
- [ ] Quyền xóa (Art. 17): không ghi dữ liệu cá nhân lên chain nếu không xóa được. Cách coi dữ liệu băm onchain: CHƯA XÁC MINH. [EU-GDPR]
- [ ] Mức phạt nặng nhất: tới 20 triệu EUR hoặc 4% doanh thu toàn cầu, lấy số cao hơn (Art. 83(5)). [EU-GDPR]
- [ ] Căn cứ xử lý (Art. 6), chuyển dữ liệu ra ngoài EU (Chương V): chưa đọc lại khi làm repo. CHƯA XÁC MINH

## B. Cookie

- [ ] Lưu hoặc đọc thông tin trên thiết bị người dùng cần đồng ý, trừ khi thực sự cần để cung cấp dịch vụ người dùng yêu cầu (Art. 5(3)). [EU-EPR]
- [ ] Lưu ý: Art. 5(3) nói về thiết bị, không chỉ cookie. `localStorage` cho analytics cũng cần xem xét. Lưu trạng thái ví đang kết nối thường thuộc diện cần thiết, mức độ cụ thể theo từng nước: CHƯA XÁC MINH. [EU-EPR]
- [ ] Luật quốc gia từng nước nội luật hóa, có thể khác nhau. CHƯA XÁC MINH

## C. MiCA

- [ ] Dự án có cung cấp dịch vụ crypto-asset không: giữ hộ, sàn, đổi, thực hiện lệnh, nhận chuyển lệnh, tư vấn, chuyển hộ (Art. 3(1)(16)). Có thì cần giấy phép (Art. 59). [EU-MICA]
- [ ] Hết chuyển tiếp: nhà cung cấp cũ chỉ được hoạt động tới 01/07/2026 hoặc khi có quyết định, nước thành viên có thể rút ngắn (Art. 143(3)). Từ nay không còn lý do "đang chờ". [EU-MICA]
- [ ] Bên chưa được cấp phép cần rút lui có trật tự. Bản tin AMF có nêu, tuyên bố gốc của ESMA: CHƯA XÁC MINH. [EU-ESMA]
- [ ] Hoàn toàn phi tập trung không trung gian thì ngoài phạm vi. Làm một phần phi tập trung vẫn trong phạm vi (Recital 22). Không có định nghĩa chính xác: hỏi luật sư. [EU-MICA]
- [ ] Doanh nghiệp ngoài EU chỉ được miễn khi khách **hoàn toàn tự tìm đến**. Có chào mời, kể cả qua bên thứ ba, là mất miễn trừ (Art. 61(1)). [EU-MICA]
- [ ] Token, stablecoin, tiếp thị: xem các file trong `crypto/`. [EU-MICA]
- [ ] Mức phạt cụ thể của MiCA theo Art. 111: xem `penalties.md`. [EU-MICA]

## D. AI Act

- [ ] Chatbot phải cho người dùng biết đang nói chuyện với AI, trừ khi hiển nhiên (Art. 50(1)). Nghĩa vụ của nhà cung cấp, bên nhúng nên kiểm tra. [EU-AI]
- [ ] Hệ thống tạo nội dung phải đánh dấu đầu ra dạng máy đọc được (Art. 50(2)). Hệ thống ra thị trường trước 02/08/2026 có đến 02/12/2026. [EU-AI] [EU-OMNI]
- [ ] Deepfake phải công bố là do AI tạo hoặc chỉnh sửa (Art. 50(4)). [EU-AI]
- [ ] Hệ thống rủi ro cao theo Annex III lùi tới 02/12/2027, theo Annex I lùi tới 02/08/2028. Đừng dẫn mốc cũ 02/08/2026. [EU-OMNI]
- [ ] Vi phạm minh bạch Art. 50: tới 15 triệu EUR hoặc 3% doanh thu (Art. 99(4)(g)). [EU-AI]
- [ ] AI chấm điểm tín dụng là rủi ro cao theo Annex III. Chatbot hỗ trợ thường không phải. Việc phân loại agent giao dịch: CHƯA XÁC MINH.
