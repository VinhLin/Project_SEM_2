### Làm theo hướng dẫn
- [Video](https://www.youtube.com/watch?v=PgielyUFGeQ)
- [Link tham khảo](https://boredadmin.com/configure-opnevpnn-in-pfsense-and-export-client/)

## Step by step
### Certificate 
- Trước khi tiến hành setup OpenVPN, mình cần tạo một **Certifiacate**.
- vào **System** -> **Certificate Manager** -> **CAs** -> **Add**.
- Thực hiện như sau:
```
Descriptive name: Home_PC - VPN Remote Access
Method: Create an internal Certificate Authority
Lifetime: 3650
Common Name: Home_PC
```
- Các cấu hình còn lại mình giữ nguyên -> **Save**.
- Tiếp theo qua phần **Certificates** -> **Add/Sign**. Thực hiện các thao tác sau:
```
Method: Create an internal Certificate Authority
Descriptive name: HOME_PC_VPN_SERVER_CERT
Certificate authority: Home_PC - VPN Remote Access
Lifetime: 3650
Common Name: Home_PC
Certificate Type: Server Certificate
```
- Sau đó nhấn **Save**.

### OpenVPN
- Vào **VPN** -> **OpenVPN**




