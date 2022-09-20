### Tham khảo
```
https://docs.netgate.com/pfsense/en/latest/recipes/ipsec-s2s-psk.html
https://www.ceos3c.com/pfsense/pfsense-site-to-site-vpn/
https://blog.infoitech.co.uk/pfsense-ipsec-vpn-routed-vti-site-to-site/
```

------------------------------------------------------------------------------------------------
## Làm theo [Link hướng dẫn](https://www.ceos3c.com/pfsense/pfsense-site-to-site-vpn/)
- Ở đây mình có 2 nơi.
- Một gọi là **HQ** với:
```
Một con firewall pfsense có: WAN IP là 192.168.1.12/24 và LAN IP là 10.100.100.1/24
Một PC có LAN IP là 10.100.100.20/24
```
- Nơi còn lại gọi là **Remote Location** với:
```
Một con firewall pfsense có: WAN IP là 192.168.1.13/24 và LAN IP là 172.16.3.1/24
Một PC có LAN IP là 172.16.3.20/24
```

### Cấu hình IPSec cho HQ
#### IPSec Phase 1 
- Vào **VPN** -> **IPSec** -> **Add P1**.
- Thực hiện một số thao tác sau:
```
Description: IPSec from pfsense 1 HQ <-> pfsense 2 Remote Location
Key Exchange version: IKEv1
Remote Gateway: 192.168.1.13
```
- Sau đó nhấn vào ô **Generate new Pre-Shared Key**. 
- Copy key được ra một file khác (ví dụ tên file là: Pre-Shared_Key.txt)
- Để mặc định các dòng còn lại, nhấn **Save** và nhấn **Apply Changes**.
#### IPSec Phase 2
- Nhấn **Show Phase 2** -> **Add P2**.
- Chỉnh lại thông số:
```
Local Network: Network		Address: 10.100.100.0/24
Remote Network: Network		Address: 172.16.3.0/24
Encryption Algorithms: AES - 256 bits
PFS key group: 15 (3072 bit)
Ping host: 172.16.3.1
```
- Sau đó nhấn **Save** và **Apply Changes**.
### Thiết lập Firewall Rules
- Vào **Firewall** -> **Rules** -> **IPSec** -> **Add**.
- Thay đổi một số thông tin sau:
```
Protocol: Any
Source: Network - 172.16.3.0/24
Description: IPSec Allow Everything from pfsense 2 Remote Location
```
- Sau đó **Save** lại.

### Cấu hình IPSec cho Remote Location
- Thực hiện tương tự như bên HQ.
#### IPSec Phase 1 
- Vào **VPN** -> **IPSec** -> **Add P1**.
- Thực hiện một số thao tác sau:
```
Description: IPSec from pfsense 2 Remote Location <-> pfsense 1 HQ
Key Exchange version: IKEv1
Remote Gateway: 192.168.1.12
```
- Copy key trong file **Pre-Shared_Key.txt** và dán vào phần **Pre-Shared Key**
- Để mặc định các dòng còn lại, nhấn **Save** và nhấn **Apply Changes**.
#### IPSec Phase 2
- Nhấn **Show Phase 2** -> **Add P2**.
- Chỉnh lại thông số:
```
Local Network: Network		Address: 172.16.3.0/24
Remote Network: Network		Address: 10.100.100.0/24
Encryption Algorithms: AES - 256 bits
PFS key group: 15 (3072 bit)
Ping host: 10.100.100.1
```
- Sau đó nhấn **Save** và **Apply Changes**.
### Thiết lập Firewall Rules
- Vào **Firewall** -> **Rules** -> **IPSec** -> **Add**.
- Thay đổi một số thông tin sau:
```
Protocol: Any
Source: Network - 10.100.100.0/24
Description: IPSec Allow Everything from pfsense 1 HQ
```
- Sau đó **Save** lại.

-------------------------------------------------------------------------------------
## Kết quả là đã Ping và Traceroute thành công

