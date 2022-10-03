### Problem `data-cipher (2.4.4) pfsense error`
- Khi mình có file **.ovpn** và chạy file này thì nó báo lỗi.
- Sau khi [research](https://forum.netgate.com/topic/158565/getting-error-on-data-ciphers-line-on-ovpn-client/3) thì biết nguyên nhân là do **version** của OpenVPN trên Ubuntu nó chạy là 2.4.4
- Mà pfsense đang **được cài đặt openvpn-client-export version là 2.5.2** (như hình PC_connect_pfsense.png)
- Nên mình cần **update version OpenVPN của Ubuntu trên 2.5.2**

### Tham khảo
```
https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos
https://build.openvpn.net/debian/openvpn/release/2.5/pool/
https://boredadmin.com/configure-opnevpnn-in-pfsense-and-export-client/
```

### Update OpenVPN on Ubuntu 18.04
```
sudo su
curl -fsSL https://swupdate.openvpn.net/repos/repo-public.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/openvpn-repo-public.gpg
```
- Thay đổi tham số **<version>** và **<osrelease>** cho phù hợp với câu lệnh bên dưới.
```
$ echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/openvpn-repo-public.gpg] https://build.openvpn.net/debian/openvpn/<version> <osrelease> main" > /etc/apt/sources.list.d/openvpn-aptrepo.list
```
- Với Ubuntu 18.04 thì sẽ là:
```
$ echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/openvpn-repo-public.gpg] http://build.openvpn.net/debian/openvpn/release/2.5 bionic main" > /etc/apt/sources.list.d/openvpn-aptrepo.list
```
- Rồi cài đặt lại OpenVPN:
> sudo apt update && apt-get install openvpn