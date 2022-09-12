## Tham khảo
```
https://maychuvatly.com/blog/routing-2-pfsense-27/
https://docs.netgate.com/pfsense/en/latest/routing/static.html
```

### Note
- **SW_Core** mình có ip address ở *Et0/1* là **10.100.100.20/24** chung lớp mạng với *pfsense*.
- Ngoài ra mình có thêm các ip của vlan trên *SW_Core* là:
```
192.168.2.1/26
192.168.2.65/26
192.168.2.129/28
192.168.2.145/29
```
- Để *pfsense* có thể **ping** được tới các ip trên thì mình cần thực hiện các bước.
- Trên con **PC_Test**, truy cập vào link: **https://10.100.100.1**
- Đăng nhập:
```
login: admin
pass: pfsense
```
- Vào **System** -> **Routing**. Trong phần **Gateways** mình cần add mới một gateway. Như hình *Add_new_Gateways.png*
- Vào phần **Static Routes**, add thêm các network, như hình *Add_Network.png*
- Sau đó nhấn **Apply**, mình test thì đã có thể từ **pfsense ping được tới các IP vlan của SW_Core**.
- Kết quả như hình *Result.png*



