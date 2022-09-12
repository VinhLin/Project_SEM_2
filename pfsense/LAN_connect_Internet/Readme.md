- Mình có con pfsense với IP là:
```
WAN: 192.168.1.7/24
LAN: 172.16.3.1/24
```
- Mình có thể từ 172.16.3.1 ping tới 192.168.1.7
- Có thể ping tới 8.8.8.8 với source là 192.168.1.7
- Nhưng từ 172.16.3.1 thì không ping được 8.8.8.8

### Khắc phục
- Lên pfsense chỉnh lại phần **LAN** trong trang config.
- Vào **Interfaces** -> **LAN**.
- Lưu ý phần **IPv4 Upstream gateway** là **None**.
- Sau đó save lại.

### Kết quả
- Mình đã ping được 8.8.8.8 với source 172.16.3.1
- Câu lệnh:
```
ping -S 172.16.3.1 8.8.8.8
```

