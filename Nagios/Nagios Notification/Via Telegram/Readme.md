### Documents
```
https://github.com/mglantz/nagios-telegram-notification
https://cloud-infra.engineer/nagios-notifications-via-telegram/
https://vnsys.wordpress.com/2018/10/04/nagios-gui-canh-bao-qua-telegram/
```

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
- Mình có được Token, lưu lại token này.
```
Token: 5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M
UserID: 5654292386
```
- Tìm thư mục chứa **nagios_telegram**, trên nagios nó có sẵn script là *check_api* hoặc *check_by_ssh*, dùng câu lệnh **find** để tìm:
```
find / -name check_api
```
- Ở đây mình tìm đc thư mục **/usr/local/nagios/libexec/**. Download script *nagios_telegram*
```
sudo su
wget -O nagios_telegram.py https://raw.githubusercontent.com/pommi/telegram_nagios/master/telegram_nagios.py
chmod 755 nagios_telegram.py
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
# commands to send host/service notifications
define command {
  command_name     notify-host-by-telegram
  command_line     /usr/local/nagios/libexec/nagios_telegram.py --token 5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M --object_type host --contact "-5018541524" --notificationtype "$NOTIFICATIONTYPE$" --hoststate "$HOSTSTATE$" --hostname "$HOSTNAME$" --hostaddress "$HOSTADDRESS$" --output "$HOSTOUTPUT$"
}
define command {
  command_name     notify-service-by-telegram
  command_line     /usr/local/nagios/libexec/nagios_telegram.py --token 5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M --object_type service --contact "-5018541524" --notificationtype "$NOTIFICATIONTYPE$" --servicestate "$SERVICESTATE$" --hostname "$HOSTNAME$" --servicedesc "$SERVICEDESC$" --output "$SERVICEOUTPUT$"
}
```

```
# Host notification via Telegram bot
define command{
        command_name    notify-host-by-telegram
        command_line     curl -k -L --data chat_id=-5018541524 --data-urlencode "text=***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Host: $HOSTNAME$ State: $HOSTSTATE$ Address: $HOSTADDRESS$ Info: $HOSTOUTPUT$ Date/Time: $LONGDATETIME$" "https://api.telegram.org/bot5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M/sendMessage"
        }

# Service notification via Telegram bot
define command{
        command_name    notify-service-by-telegram
        command_line   curl -k -L --data chat_id=-5018541524 --data-urlencode "text=***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Service: $SERVICEDESC$ Host: $HOSTALIAS$ Address: $HOSTADDRESS$ State: $SERVICESTATE$ Date/Time: $LONGDATETIME$ Additional Info: $SERVICEOUTPUT$" "https://api.telegram.org/bot5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M/sendMessage"
        }
```



















