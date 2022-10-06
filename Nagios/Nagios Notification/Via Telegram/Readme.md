### Documents
```
https://github.com/mglantz/nagios-telegram-notification
https://cloud-infra.engineer/nagios-notifications-via-telegram/
https://vnsys.wordpress.com/2018/10/04/nagios-gui-canh-bao-qua-telegram/
```

---------------------------------------------------------------------------------------
## Note
- Dùng đoạn code python [nagios_telegram](https://raw.githubusercontent.com/pommi/telegram_nagios/master/telegram_nagios.py) không được.
- Lý do vì phải dùng thư viện **from twx.botapi import TelegramBot**.
- Mà [twx.botapi](https://github.com/datamachine/twx.botapi) đã bị dừng (out of date)
> WARNING: This project is effectively retired, and won't be seeing any dev or support. There may be random commits in the future as we use it for side projects, but it's basically dead. There's plenty of other well maintained and feature rich (or feature lean) python TG libraries so you shouldn't have a problem finding another. Thanks for all the support and use in the past few years!

- Do đó mình sẽ không dùng code python mà notifications trực tiếp bằng **curl**. [Tham khảo](https://gist.github.com/dideler/85de4d64f66c1966788c1b2304b9caf1).

---------------------------------------------------------------------------------------
### Setup Telegram
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
- Ở đây mình tìm đc thư mục **/usr/local/nagios/libexec/**. Tạo script *nagios_telegram.sh*.
```
touch nagios_telegram.sh
sudo chmod 755 nagios_telegram.sh
nano nagios_telegram.sh
```
- Add nội dung sau:
```
#!/bin/bash

TOKEN="5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M"
ID="5018541524"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

if [ "$1" == "host" ]
then
# Test message
# curl -s -X POST $URL -d chat_id=$ID -d text="Hello $1"
	curl -s -X POST $URL -d chat_id=$ID -d text="***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Host: $HOSTNAME$ State: $HOSTSTATE$ Address: $HOSTADDRESS$ Info: $HOSTOUTPUT$ Date/Time: $LONGDATETIME$" > /dev/null 2>&1
	
	exit 0
else
# Test message	
# curl -X POST $URL -d chat_id=$ID -d text="Hello World"
	curl -s -X POST $URL -d chat_id=$ID -d text="***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Service: $SERVICEDESC$ Host: $HOSTALIAS$ Address: $HOSTADDRESS$ State: $SERVICESTATE$ Date/Time: $LONGDATETIME$ Additional Info: $SERVICEOUTPUT$" > /dev/null 2>&1
	exit 0
fi
```
- Di chuyển file script sang thư mục */usr/local/nagios/libexec/*
```
mv nagios_telegram.py /usr/local/nagios/libexec/
cd /usr/local/nagios/libexec/
ls -lh |grep nagios_telegram
```
- Vào file *config*: 
```
cd /usr/local/nagios/etc/
nano commands.cfg
```
- Add thêm nội dung:
```
# Host notification via Telegram bot
define command {
        command_name    notify-host-by-telegram
        command_line    /usr/local/nagios/etc/nagios_telegram.sh host
}

# Service notification via Telegram bot
define command {
        command_name    notify-service-by-telegram
        command_line    /usr/local/nagios/etc/nagios_telegram.sh service
}
```














