## Command
### Check service nagios
```
sudo systemctl status nagios.service
```

### [Check version plugin](https://support.nagios.com/forum/viewtopic.php?f=7&t=40848)
```
cd /usr/local/nagios/libexec
ls
./check_disk --version
```
- Kết quả mình thu được là: `check_disk v2.3.3 (nagios-plugins 2.3.3)`

### User Nagios
```
sudo su
su nagios
whoami
```

-----------------------------------------------------------------------------------
## Documents
```
https://phoenixnap.com/blog/nagios-monitoring-tutorial
https://assets.nagios.com/handouts/nagiosxi/Nagios-XI-Features.pdf
https://www.nagios.com/solutions/network-monitoring-tools/
https://www.tutorialspoint.com/nagios/nagios_commands.htm
https://assets.nagios.com/downloads/nagioscore/docs/externalcmds/
```

--------------------------------------------------------------------------------------
## Note
- Hiện tại với **free version** của Nagios thì nó cho tối đa là 7 hosts.
- Nhưng tối đa chỉ thực hiện được **100 lệnh check_command**.
- Nếu mình chỉ dùng 3 hosts, nhưng service lại hơn 100 lệnh, thì nagios vẫn báo nhắc nhở **license limits**.








