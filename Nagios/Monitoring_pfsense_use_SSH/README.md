### Documents
```
https://github.com/oneoffdallas/pfsense-nagios-checks
https://linuxincluded.com/monitoring-pfsense-with-nagios-xi-using-ssh-part-1/
https://linuxincluded.com/monitoring-pfsense-with-nagios-xi-using-ssh-part-2/
https://linuxincluded.com/monitoring-pfsense-with-nagios-xi-using-ssh-part-3/
https://bobcares.com/blog/nagios-monitor-hosts-using-ssh/
```

### Note
- Việc **Monitor** bằng **SSH** thực ra là mình chạy các đoạn **script** trên máy client.
- Và các giá trị trả về sẽ được show trên thiết bị Monitor, ở đây chính là **Nagios Monitoring**.
- Do đó việc monitor bằng SSH có thể thực hiện trên hầu hết các thiết bị Linux.
- Vì vậy mình sẽ thiết lập **cấu hình Monitor bằng SSH giữa Nagios và pfsense**.

---------------------------------------------------------------------------------------------------
# Setup Monitoring SSH

## Thiết lập Keygen cho Nagios
- Mình thực hiện các command sau:
```
sudo su
su nagios
ssh-keygen -t ed25519
cat /home/nagios/.ssh/id_ed25519.pub
```
- **Copy lại key này ra một file text**.

## Cài đặt trên pfsense

### Tạo user nagios cho pfsense
- Vào trang Web GUI config của pfsense.
- Vào **System** -> **User Manager** -> **Users** -> **Add**
- Điền thông tin sau:
```
Username: nagios
Pass: pfsense
Full name: Nagios Monitor
```
- Phần **Keys** mình sẽ past nội dung key đã được lưu trong file text.
- Sau đó **Save** lại.

### Cài đặt package sudo cho pfsense
- Vào **System** -> **Package Manager** -> **Available Packages**
- Kiếm đến package **sudo**, sau đó tiến hành cài đặt.
- Sau đó vào **Package** -> **sudo** -> **Add**.
- Thiết lập như sau:
```
Phần User/Group chọn User: Nagios
Phần Run As chọn User: root
Tích V vào ô No Password
Phần Command List ghi là ALL
```
- Sau đó **Save** lại.

### Bật SSH trên pfsense
- Có 2 cách thực hiện.
- Cách 1: Vào **System** -> **Advanced**. Tích **V** vào ô **Enable Secure Shell**, sau đó **Save** lại.
- Cách 2: là bật **sshd** trong **mode 14** trong command line pfsense.

## SSH 

### Test SSH trên Nagios
- Quay lại trên **Nagios**, mình sẽ cần test thử **ssh vào pfsense**.
- IP LAN của pfsense là: `172.16.3.1`
- Nên mình sẽ thực hiện command sau:
```
ssh nagios@172.16.3.1
```
- Pass là `pfsense`. Kết quả là đã **SSH thành công**.

### Cài đặt nagios-plugin cho pfsense
- Mình có thể tiến cài đặt sau khi đã ssh.
- Còn không thì mình vào phần **command line** của pfsense, chọn **mode 8** để tiến hành cài đặt.
- Thực hiện các câu lệnh:
```
sudo pkg install nagios-plugins
/usr/local/libexec/nagios/check_procs
curl -LO https://github.com/oneoffdallas/pfsense-nagios-checks/archive/master.zip
sudo unzip -j master.zip -d /usr/local/libexec/nagios/
sudo chmod +x /usr/local/libexec/nagios/check_pf_*
```
- Test:
```
cd /usr/local/libexec/nagios/
ls 
./check_pf_version
```

## Setup trên Nagios
- Vào trang WebUI để thiết lập cho Nagios
- Vào **Navigation** -> **Configure** -> **Satrt Monitoring Now** -> **SSH Proxy**.
- Thực hiện:
```
IP address: 172.16.3.1
OS: FreeBSD
Host name: pfsense-home
```
- Thực hiện add các command mà mình muốn **Monitor**.
- Tiếp đến thực hiện các bước để hoàn tất việc setup.




























