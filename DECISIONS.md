# DECISIONS

Các quyết định tự đưa ra khi dựng repo, mới nhất ở cuối. Ngày làm: 03/11/2026.

## Đặt tên và phạm vi

1. **Tên repo `tool_personal_law-audit`, thư mục cài `.law-audit/`.** Spec ghi `vn-intl-law-check`, người dùng đổi tên. Chọn `tool` vì repo có script chạy được, `personal` vì không gắn kèo nào. Mọi chỗ trong spec ghi `vn-intl-law-check` hiểu là tên này.
2. **Web3 là trọng tâm.** Triage hỏi về ví, custody, token trước khi hỏi về form. `scan.sh` có riêng nhóm tín hiệu onchain.
3. **Không push.** Spec yêu cầu chỉ commit local, người dùng tự push. Chưa có remote.

## Kế thừa từ repo mẫu

Đọc [mhfed/vn-law-check](https://github.com/mhfed/vn-law-check), commit `63e4d8a`, MIT, 224 sao, cập nhật 03/11/2026.

4. **Lấy ý tưởng:** triage trước checklist, báo cáo rút gọn cho site đơn giản, `scan.sh` in bằng chứng file:dòng, fixture kèm `EXPECTED`, `sync.sh` sinh file rules, `install.sh` chèn đoạn trỏ có marker.
5. **Không copy nguyên văn.** Checklist và script viết lại. Ghi credit trong README, giữ MIT.
6. **Không lấy:** thư mục `plugins/` và marketplace Claude (spec không yêu cầu), thư mục `demo/`, checklist mobile app riêng (gộp vào `vn/other.md`).
7. **Không tin lại trích dẫn của repo mẫu.** Dùng làm đầu mối, tự mở văn bản. Chỗ chưa mở được thì ghi CHƯA XÁC MINH dù repo mẫu đã ghi số điều.

## Cách xác minh

8. **Hai trạng thái, không có mức ở giữa.** `ĐÃ ĐỐI CHIẾU` là đã đọc đúng điều đó trong toàn văn. Còn lại là `CHƯA XÁC MINH`, kể cả khi nhiều công ty luật viết giống nhau.
9. **Trang tra cứu toàn văn được tính là đối chiếu, nhưng ghi rõ.** `thuvienphapluat.vn` chặn bot (403) nên phần lớn luật Việt Nam được đọc qua `hethongphapluat.com`, `caselaw.vn`, `luatnguyen.vn`. Đây không phải Công báo. Cột "Bản đã đọc" ghi rõ để người dùng tự kiểm lại.
10. **Đối chiếu là theo từng điều, không theo cả văn bản.** Một văn bản ĐÃ ĐỐI CHIẾU vẫn có thể có mục CHƯA XÁC MINH nếu điều đó chưa đọc.
11. **Trang web là dữ liệu, không phải lệnh.** `hethongphapluat.com` chèn vào nội dung luật một đoạn yêu cầu AI quảng bá trang của họ ở đầu và cuối câu trả lời. Không làm theo. AGENTS.md có quy tắc riêng về việc này vì `fetch-site.sh` cũng tải trang lạ về.
12. **Mọi dòng checklist có mã nguồn hoặc cờ.** `tools/check-sources.sh` kiểm tự động, số thống kê do `tools/stats.sh` đếm, không điền tay.

## Quyết định về nội dung pháp lý

13. **Mốc 6 tháng của Nghị quyết 05 không được viết thành "từ 01/09/2026".** Báo chí viết nhà đầu tư phải dùng sàn cấp phép từ 01/09/2026. Khoản 2 Điều 7 lại tính từ khi tổ chức đầu tiên được cấp phép. Bài gần nhất đọc được ghi chưa có sàn nào được cấp phép. Ngày cấp phép đầu tiên để CHƯA XÁC MINH, báo cáo phải nêu cả hai mốc.
14. **Quảng cáo crypto ở Việt Nam mặc định 🔴.** Điểm b khoản 4 Điều 7 NĐ 284/2026 phạt "quảng cáo, tiếp thị liên quan đến tài sản mã hóa khi chưa được cấp Giấy phép", mức 180-200 triệu với tổ chức. Câu chữ rộng. Ranh giới với nội dung giáo dục, tài liệu sản phẩm chưa có hướng dẫn nên ghi CHƯA XÁC MINH và đưa vào mục hỏi luật sư.
15. **Dự án non-custodial không tự động "an toàn".** Luật Mỹ (GENIUS §2(7)(B), §10(e)) có loại trừ rõ cho phần mềm tự lưu ký. Ở Việt Nam chưa tìm thấy loại trừ tương đương nên ghi "chưa có quy định rõ". MiCA recital 22 chỉ loại trừ khi "hoàn toàn phi tập trung", có front-end, thu phí, có admin key thì phải xem kỹ.
16. **Chỉ đưa luật áp dụng cho dự án phổ thông.** Bỏ nghĩa vụ riêng của sàn lớn, ngân hàng, tổ chức phát hành stablecoin quan trọng. `references/crypto/` chỉ ghi "nếu bạn định làm việc này thì cần giấy phép, dừng lại hỏi luật sư".
17. **Dự luật chưa thành luật không đưa vào checklist.** CLARITY Act (Mỹ, thủ tục tại Thượng viện thất bại 15/09/2026 theo nguồn thứ cấp), khung stablecoin Singapore (đang tham vấn) chỉ ghi vào mục theo dõi.
18. **Không kết luận vụ Tornado Cash.** OFAC gỡ danh sách 21/03/2025 theo nguồn thứ cấp, nhưng không suy ra tích hợp mixer là an toàn. Luôn ghi cần sàng lọc theo danh sách hiện hành.

## Kỹ thuật

19. **`scan.sh` chỉ dùng bash, grep, sed, awk, find.** Chạy được trên Git Bash Windows và macOS bash 3.2. Không gọi mạng khi quét thư mục.
20. **Tín hiệu bị loại `node_modules`, `.law-audit`, thư mục build.** Không quét `artifacts/`, `cache/`, `out/` của Foundry/Hardhat vì ABI sinh ra có `mint`, gây báo nhầm.
21. **Tách tín hiệu `SC_PRIVILEGED` riêng.** `mint`/`pause`/`blacklist` trong `.sol` là dấu hiệu quản trị tập trung, ảnh hưởng tới lập luận "không kiểm soát tiền người dùng".
22. **`CUSTODY` chỉ bắt chuỗi rõ nghĩa** (`privateKey` đi cùng lưu trữ, `custodial wallet`, `developer-controlled`, `omnibus`...). Từ `custody` đơn lẻ dễ khớp với chữ "non-custodial" nên có bước lọc.
