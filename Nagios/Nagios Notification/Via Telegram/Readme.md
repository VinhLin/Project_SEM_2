### Documents
```
https://github.com/mglantz/nagios-telegram-notification
https://cloud-infra.engineer/nagios-notifications-via-telegram/
https://vnsys.wordpress.com/2018/10/04/nagios-gui-canh-bao-qua-telegram/
https://www.youtube.com/watch?v=qwaMu6LlgWw&t=1678s
```

---------------------------------------------------------------------------------------
## Note
- Dùng đoạn code python [nagios_telegram](https://raw.githubusercontent.com/pommi/telegram_nagios/master/telegram_nagios.py) không được.
- Lý do vì phải dùng thư viện **from twx.botapi import TelegramBot**.
- Mà [twx.botapi](https://github.com/datamachine/twx.botapi) đã bị dừng (out of date)
> WARNING: This project is effectively retired, and won't be seeing any dev or support. There may be random commits in the future as we use it for side projects, but it's basically dead. There's plenty of other well maintained and feature rich (or feature lean) python TG libraries so you shouldn't have a problem finding another. Thanks for all the support and use in the past few years!

- Do đó mình sẽ không dùng code python mà notifications trực tiếp bằng **curl**. [Tham khảo](https://gist.github.com/dideler/85de4d64f66c1966788c1b2304b9caf1).
- Tham khảo tài liệu:
```
https://gist.github.com/SanariSan/4c7cca1aef10dfe0e27e55cfd97e9a53
https://www.takersplace.de/2019/12/19/telegram-notifications-with-nagios/
https://www.youtube.com/watch?v=aheLt0JHUEY
https://core.telegram.org/bots/api#sending-files
https://github.com/keepwalking86/nagios-core-4x/blob/master/docs/4.send-alert-via-email-telegram.md#telegram
https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/macrolist.html
https://assets.nagios.com/downloads/nagioscore/docs/externalcmds/
```

---------------------------------------------------------------------------------------
## Setup Telegram
- [Install Telegram on Ubuntu](https://snapcraft.io/telegram-desktop)
```
sudo snap install telegram-desktop
```
- Sử dụng tài khoản Telegram, sau đó tìm `@BotFather`.
- Thực hiện tạo bot
```
/newbot
Nagios-notify
my_test_nagios_bot
```
- Mình có được Token, lưu lại token này. Và dùng lệnh sau đây để lấy **chat id**: `curl -Lk -i -X GET https://api.telegram.org/bot5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M/getUpdates`
```
Token: 5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M
chat id: 5018541524
```
- Tìm thư mục lưu trữ, trên nagios nó có sẵn script là *check_api* hoặc *check_by_ssh*, dùng câu lệnh **find** để tìm:
```
find / -name check_api
```
- Do mình sẽ dùng **curl** để notifi nên mình cần biết ứng dụng này đang này ở đâu để từ đó add cho đúng câu lệnh.
- Dùng lệnh: `which curl`, kết quả mình thu được là ở thư mục `/usr/bin/curl`.
- Các thông tin mình có được là:
```
TOKEN="5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M"
ID="5018541524"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
```
- Test bằng cách chạy trực tiếp lệnh, và xem thông báo trên **Telegram**:
```
/usr/bin/curl -s -X POST "https://api.telegram.org/bot5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M/sendMessage" -d chat_id="5018541524" -d text="Hello Guys"
```
- Theo như các tài liệu mình tham khảo được trên mạng thì mình sẽ cần add các command này vào trong file **commands.cfg** của nagios (nó nằm ở thư mục `/usr/local/nagios/etc/`)
- Tuy nhiên với version hiện tại mình đang dùng, thì nagios không cho chỉnh sửa trực tiếp trên file *commands.cfg* nữa, mà mình phải add thông qua **Config trên WebUI**.
- Đăng nhập vào giao diện WebUI của Nagios, vào **Navigation** -> **Config** -> **Core Config Manager**.
- Vào phần **Command** của "CCM Object Summary", chọn **Add new**.
- Mình sẽ thực hiện tạo command cho host, thiết lập như sau:
```
Command Name: nagios_telegram_host
Command Line: /usr/bin/curl -s -X POST "https://api.telegram.org/bot5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M/sendMessage" -d chat_id="5018541524" -d text="***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Host: $HOSTNAME$ State: $HOSTSTATE$ Address: $HOSTADDRESS$ Info: $HOSTOUTPUT$ Date/Time: $LONGDATETIME$" > /dev/null 2>&1
```
- Sau đó nhấn **Save** để Tương tự thực hiện thiết lập command cho service:
```
Command Name: nagios_telegram_service
Command Line: /usr/bin/curl -s -X POST "https://api.telegram.org/bot5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M/sendMessage" -d chat_id="5018541524" -d text="***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Service: $SERVICEDESC$ Host: $HOSTALIAS$ Address: $HOSTADDRESS$ State: $SERVICESTATE$ Date/Time: $LONGDATETIME$ Additional Info: $SERVICEOUTPUT$" > /dev/null 2>&1
```
- Cũng **Save** để Nagios lưu lại cấu hình.
 
## Test Command
- Quay lại phần **Core Config Manager** -> **Hosts**.
- Chọn thiết bị mà mình muốn test.
- Sau đó xuống phần **Check_command** -> **nagios_telegram_host**. Sau đó nhấn **Save** lại. (Có thể nhấn vào "Run Command" để chạy thử).
- Kết quả như hình **Result_Test.png**
- **Note:** Trong *Host Status Detail*, phần *Overview*, mình có thể nhấn **Force an immediate check** để Nagios check và bắn ngay tin nhắn Telegram cho mình.



