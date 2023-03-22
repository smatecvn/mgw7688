# MGWp HISTORY
* requirements: (v2.8.0 and later)
  * Python 3.9
  * pyaudio
  * pyserial
  * paho-mqtt
  * requests
  * mraa

* v4.0.12p1: 2023-03-22
  * Thay đổi:
    * Hỗ trợ cập nhật bản tin khi người dùng thay đổi playlist hoặc bản tin lúc bản tin đó đang phát.

* v4.0.12: 2022-12-08
  * Thay đổi:
    * Hỗ trợ MQTT/TLS không cần file certificates.
  * Sửa lỗi:
    * Không phát Header.

* v4.0.11p2: 2022-12-02
  * Sửa lỗi:
    * Khi thay đổi NetworkType (ETH, Mobile) từ server thì chỉ lưu thông tin cấu hình mà không thực hiện thay đổi Network của thiết bị.

* v4.0.11p1: 2022-11-29
  * Sửa lỗi:
    * Không hiển thị thông tin HTTP-SYNC server (luôn lấy giá trị mặc định).
    * CSS: tăng kích thước input/select từ 140px -> 20rem.

* v4.0.11: 2022-11-24
  * Thay đổi:
    * Thiết lập cấu hình từ xa: chỉ trường nào hợp lệ thì mới cập nhật.
    * Đổi TYPE_HEADER từ 4 -> 5.

* v4.0.10: 2022-10-31
  * Thay đổi:
    * Delay đến 20s và kiểm tra địa chỉ IP br-lan để chờ network restart đã thành công.
    * Thêm hiệu ứng FADE-IN (khi bắt đầu bản tin mới): set volume = 0, sau đó tăng dần volume đến giá trị thiết lập trong vòng 2 giây.
    * Kiểm tra trạng thái module FM: nếu đã OFF rồi thì không gửi lệnh OFF nữa (giảm log không cần thiết).
    * Sửa lệnh thiết lập volume: thêm tham số -M -> không cần chuyển đổi.
    * Hỗ trợ OPH_TAILSCALE.
    * Không phát lại Header (file.type=4).

* v4.0.9: 2022-10-25
  * Thay đổi:
    * startup: restart network (+ delay 10s) sau khi restart GSM module & setup Mobile data mode.
  * Sửa lỗi:
    * playlist thread có thể bị exception -> thêm try/catch vào vòng lặp vô hạn.

* v4.0.8: 2022-09-05
  * Sửa lỗi:
    * Không update firmware từ xa được.

* v4.0.7: 2022-08-31
  * Thay đổi:
    * Chỉ đọc số điện thoại tối đa 3 lần, nếu không được thì không đọc nữa để tránh lỗi kết nối Internet.
    * Khi thay đổi âm lượng Main, FM thì gửi ngay gói GENERIC về server.
    * Khi thay đổi trạng thái loa thì gửi ngay gói STATUS về server.
    * Thêm log LIVEMIC_START, LIVEMIC_END.
    * Đổi tần số lấy mẫu khi phát live-mic từ 8000 -> 48000.
  * Sửa lỗi:
    * Tạo 2 lần sự kiện LIVEMIC_START.

* v4.0.6: 2022-08-23
  * Sửa lỗi:
    * Không nhận gói tin phát trực tiếp qua MIC.
    * SYNC: cập nhật version cho bản tin trước khi xóa.
    * Thêm delay sau khi reboot GSM.

* v4.0.5: 2022-07-30
  * Sửa lỗi:
    * Cấu hình GSM ở thread khác -> có thể làm việc khởi tạo MQTT, Web bị lỗi -> thiết bị lặp lại việc reboot.

* v4.0.4: 2022-07-29
  * Sửa lỗi:
    * Bỏ việc xóa bản tin cũ khi đồng bộ với server.

* v4.0.3: 2022-07-28
  * Sửa lỗi:
    * Tx GENERIC: correct data type for 'disabled' field.
    * Log PLAY/STOP: chỉ dùng cho lệnh từ server (Show.Action).

* v4.0.2: 2022-07-27
  * New app_config implementation.

* v4.0.1: 2022-07-18
  * Using only OPH_MEDIA_V3 packet (remove OPH_MEDIA_xxx packets).

* v4.0.0: 2022-07-11
  * Notes: dựa theo tài liệu "MGW-MQTT v4 specification".
  * New implementation.
