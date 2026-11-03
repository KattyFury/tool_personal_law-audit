# Mẫu báo cáo

Dự án trong mẫu là giả lập. Chọn mẫu theo loại ở bước triage. Chỉ liệt kê phần áp dụng, phần còn lại gom một dòng.

---

## Mẫu rút gọn (loại A)

> **Rà soát pháp lý: minh-notes** (03/11/2026)
>
> Trang tĩnh, `scan.sh` báo `TYPE=A`: không form, không tracking, không ví, không nội dung tiếp thị. Chưa thấy nghĩa vụ đáng kể trong phạm vi bộ luật này.
>
> Rà lại khi thêm form, tracking, kết nối ví hoặc nội dung về token.
>
> *Đây là rà soát ban đầu do AI thực hiện, không phải tư vấn pháp lý.*

---

## Mẫu đầy đủ (loại C, D)

# Rà soát pháp lý: DemoSwap

**Ngày:** 03/11/2026. **Kết quả quét:** `TYPE=C REGION=VN,EU WALLET=yes CUSTODY=no SWAP=yes SANCTIONS=no PROMO=yes`.

**Triage**

| Câu hỏi | Trả lời | Bằng chứng |
|---|---|---|
| Khu vực | VN, EU. Mỹ không rõ nên rà như có | `index.html:2` `lang="vi"`, `pricing.tsx:8` EUR |
| Dữ liệu | Có email, Google Analytics | `Newsletter.tsx:12`, `layout.tsx:5` |
| Ví, custody | Có ví. Backend không thấy lưu khóa. Contract có `sweep` do admin gọi | `App.tsx:3`, `Router.sol:88` |
| Token | Không phát hành, chỉ tích hợp | Không có `TOKEN_ISSUE` |
| Thanh toán, phí | Thu 0,3% phí swap | `Router.sol:42` |
| KYC, trừng phạt | Không có | Không có tín hiệu |
| Tiếp thị | Có | `Landing.tsx:21` |
| AI | Không | |
| Trẻ em | Không nhắm tới | |

**Tổng quan:** 🔴 3, 🟡 3, 🟢 1. **Không áp dụng:** AI, COPPA, phát hành token, Singapore (không có dấu hiệu người dùng).

### 🔴 Cần xử lý ngay

**1. Landing page cam kết lợi nhuận và tiếp thị token nhắm tới người Việt**
- `src/Landing.tsx:21`: "Lợi nhuận đảm bảo 20% APY, không rủi ro"
- Căn cứ: khoản 4 Điều 4 [NQ 05/2025/NQ-CP](https://vanban.chinhphu.vn/?docid=215249&pageid=27160), điểm b khoản 4 Điều 7 [NĐ 284/2026/NĐ-CP](https://luatnguyen.vn/van-ban-phap-luat/nghi-dinh-284-2026-nd-cp-2321.html) (Việt Nam). Art. 66(2) [MiCA](https://eur-lex.europa.eu/eli/reg/2023/1114/oj/eng) (EU, nếu là nhà cung cấp dịch vụ).
- Vì sao rủi ro: ở Việt Nam chỉ tổ chức có giấy phép mới được quảng cáo, tiếp thị liên quan đến tài sản mã hóa. Mức tối đa theo quy định là 200 triệu đồng với tổ chức. Câu chữ cam kết lợi nhuận còn có nguy cơ gây hiểu lầm ở mọi khu vực. Ranh giới giữa tiếp thị và giới thiệu sản phẩm: CHƯA XÁC MINH.
- Đề xuất: bỏ "đảm bảo", "không rủi ro". Hỏi luật sư có nên tách nội dung theo khu vực.

**2. Router có hàm admin chuyển tiền đi nhưng trang chủ viết "non-custodial"**
- `contracts/Router.sol:88`: `sweep()` chỉ `onlyOwner`. `src/Landing.tsx:30`: "Chúng tôi không bao giờ chạm vào tiền của bạn"
- Căn cứ: Recital 22 [MiCA](https://eur-lex.europa.eu/eli/reg/2023/1114/oj/eng) (EU), mục 4.4 [FinCEN FIN-2019-G001](https://www.fincen.gov/sites/default/files/2019-05/FinCEN%20Guidance%20CVC%20FINAL%20508.pdf) (Mỹ). Việt Nam: chưa có quy định rõ, CHƯA XÁC MINH.
- Vì sao rủi ro: khóa admin làm yếu lập luận "không trung gian". Lời nói trên trang chủ có thể sai với thực tế.
- Đề xuất: kiểm tra `sweep` có đụng tới tiền người dùng không. Nếu chỉ thu phí, giới hạn lại và ghi rõ. Công khai ai giữ khóa.

**3. Thu email và chạy Google Analytics trước khi có đồng ý**
- `src/Newsletter.tsx:12`, `src/layout.tsx:5`
- Căn cứ: khoản 2, điểm a và d khoản 4 Điều 9 [Luật 91/2025/QH15](https://hethongphapluat.com/luat-bao-ve-du-lieu-ca-nhan-2025.html) (Việt Nam). Art. 5(3) [ePrivacy](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:02002L0058-20091219) (EU).
- Vì sao rủi ro: không có ô đồng ý, không có banner. Analytics chạy ngay khi tải trang. Mức tối đa theo quy định cho vi phạm chung là 3 tỷ đồng với tổ chức (Việt Nam).
- Đề xuất: nạp analytics sau khi đồng ý. Thêm ô không tích sẵn cạnh form, lưu thời điểm đồng ý.

### 🟡 Nên cải thiện

**4. Không sàng lọc trừng phạt**
- Không có tín hiệu `SANCTIONS`.
- Căn cứ: [OFAC Guidance](https://ofac.treasury.gov/media/913571/download?inline) (Mỹ, áp dụng khi có yếu tố Mỹ).
- Đề xuất: sàng lọc địa chỉ theo danh sách SDN ở bước front-end. Có người dùng Mỹ hay không: cần xác nhận.

**5. Dùng Vercel và API nước ngoài để xử lý email người Việt**
- `vercel.json:1`
- Căn cứ: điểm c khoản 1, khoản 2 Điều 20 [Luật 91/2025/QH15](https://hethongphapluat.com/luat-bao-ve-du-lieu-ca-nhan-2025.html) (Việt Nam).
- Đề xuất: lập hồ sơ đánh giá tác động trong 60 ngày, trừ khi được miễn theo Điều 38. Mẫu hồ sơ: CHƯA XÁC MINH.

**6. Giao diện swap cho người Việt**
- `src/Swap.tsx`. CHƯA XÁC MINH.
- Căn cứ: khoản 3 Điều 3, khoản 4 Điều 4 NQ 05/2025. Có phải "dịch vụ liên quan đến tài sản mã hóa" khi người dùng tự ký hay không: chưa có quy định rõ.
- Đề xuất: đưa vào câu hỏi cho luật sư, xem mục dưới.

### 🟢 Đạt

- Không lưu private key hoặc seed ở backend (đã đọc `api/`, không thấy). Khi rà lại phải đọc lại phần này.

### Xung đột Việt Nam vs quốc tế

| Vấn đề | Việt Nam | EU | Cách xử lý |
|---|---|---|---|
| Tiếp thị token | Chỉ bên có giấy phép | Được nếu đúng quy định | Tách nội dung theo khu vực, hỏi luật sư |
| Cơ sở thu dữ liệu | Đồng ý là chính | Có nhiều căn cứ, CHƯA XÁC MINH | Dùng đồng ý cho cả hai |

### Nên hỏi luật sư

1. Nội dung landing page có phải "quảng cáo, tiếp thị liên quan đến tài sản mã hóa" không.
2. `sweep` có làm dự án thành bên kiểm soát tiền người dùng không.
3. Thiếu đồng ý với email và analytics, cần báo cáo gì nếu đã thu từ trước.

*Đây là rà soát ban đầu do AI thực hiện, không phải tư vấn pháp lý. Xác minh lại văn bản còn hiệu lực trước khi quyết định.*
