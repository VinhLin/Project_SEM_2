### Documents
```
https://viblo.asia/p/high-available-for-pfsense-0bDM6wy2G2X4
https://docs.netgate.com/pfsense/en/latest/highavailability/index.html
https://www.youtube.com/watch?v=U-cTRf5uUEY
```

### Note
- Để đảm bảo tính **HA (High Available)** thì trên Router mình có giao thức **VRRP** (với Cisco thì gọi là **HSRP**).
- Vậy với firewall pfsense thì được gọi là **CARP (Common Address Redundancy Protocol)**.
- Giao thức này được phát triển bởi **OpenBSD**, nên hoàn toàn **free**.
- Giao thức **CARP** hoạt động dưới hình thức **active/passive**.

--------------------------------------------------------------------------------------
## Cấu hình CARP trên pfsense
- Ở đây mình có 2 con pfsense gọi là **FW_pfsense_Active_B** và **FW_pfsense_Standby_B**
- IP local **LAN** sẽ là:
```
Active: 172.16.3.1/24
Standby: 172.16.3.2/24
IP ảo (Virtual IP): 172.16.3.3
```

### Đối với Active (IP 172.16.3.1)
- Vào **System** -> **High Avail. Sync**.
- Thực hiện các thao tác sau:
```
Tích V vào ô Synchronize States
Synchronize Interface: LAN
pfsense Synchronize Peer IP -> Điền IP Slave là: 172.16.3.2 
Synchronize Config to IP -> Điền IP Slave là: 172.16.3.2 
```
- Phần username và pass mình điền là:
```
username: admin
pass: pfsense
```
- Sau đó chọn **Toogle All**, rồi nhấn **Save**.
- Tiếp tục vào phần **Firewall** -> **Virtual IPs** -> **Add**
- Thực hiện:
```
Type: CARP
Interface: LAN
Address(es): 172.16.3.3/24
Password: 172.16.3.3
```
- Phần **Skew** mình chọn là **0**, vì mình muốn đây là **Active**.
- Sau đó save lại.
- Muốn kiểm tra lại thì vào **Status** -> **CARP (failover)**

### Đối với Standby (IP 172.16.3.2)
- Làm tương tự như trên.
- Chỉ thay đổi một số thứ:
```
pfsense Synchronize Peer IP -> Điền IP Slave là: 172.16.3.1
Synchronize Config to IP -> Điền IP Slave là: 172.16.3.1
```
- Virtual IP phần **Skew** mình đổi thành **100** để nó thành **Backup**.





