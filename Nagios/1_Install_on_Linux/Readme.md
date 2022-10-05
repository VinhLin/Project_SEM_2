## Documnets compare Prometheus vs Nagios
```
https://logz.io/blog/prometheus-vs-nagios-metrics/
https://cloudinfrastructureservices.co.uk/nagios-vs-prometheus-open-source-monitoring-tool/
```
> Nagios is a very powerful platform for application networks and security. 
> Prometheus is useful for monitoring app functionality,

----------------------------------------------------------------------------------
### [Installing Nagios XI Manually on Linux](https://assets.nagios.com/downloads/nagiosxi/docs/Installing-Nagios-XI-Manually-on-Linux.pdf)

### [How to install Nagios on Ubuntu 20.04](https://linuxhint.com/install_nagios_ubuntu/)
- Step 1: Check for the updates:
```
sudo apt update
sudo apt install -y build-essential apache2 php openssl perl make php-gd libgd-dev libapache2-mod-php libperl-dev libssl-dev daemon wget apache2-utils unzip
```
- Step 2: Create a user account
```
sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
sudo usermod -a -G nagcmd www-data
```
- Step 3: Download Nagios
```
sudo su
curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sh
```
- Mình đã cài đặt thành công.

### Login
- Trước hết là check địa chỉ IP của máy mình, ví dụ: http://192.168.91.75
- Truy cập vào trang: http://192.168.91.75/nagiosxi/
- Thực hiện khai báo, đặt tên và pass. Ví dụ:
```
login: nagiosadmin
pass: projectSEM2
```

