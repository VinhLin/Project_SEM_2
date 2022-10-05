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

```
wget -O /usr/local/bin/nagios_telegram.py https://raw.githubusercontent.com/pommi/telegram_nagios/master/telegram_nagios.py
chmod 755 /usr/local/bin/nagios_telegram.py
```


