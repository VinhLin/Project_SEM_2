# Project_SEM_2
Lab project Jetking SEM2
bảng phân công công việc
https://docs.google.com/spreadsheets/d/1Qv2cCKSXS4DtV4rxd2ezQ3oRR3AkluJIYRX271ewn3E/edit#gid=0

## Yêu cầu
- Tạo kết nối **tunel** giữa *Tòa nhà A* và *Tòa nhà B*, để các PC giữa 2 tòa nhà có thể **ping** với nhau.
- Các PC trong cả 2 tòa nhà đều truy cập được Internet.
- Monitoring hệ thống.

### Tòa nhà A
- Phần **wifi_showroom** chỉ được phép truy cập Internet.
- Các PC trong mạng có thể **Ping được với nhau**.
- **NAS_Server** thì chỉ có *phòng R&D* là truy cập được.
- Cấu hình dự phòng **gateway** cho *Tòa nhà A*.

### Tòa nhà B
- Phần **wifi_showroom** và phần **wifi_guest** chỉ được phép truy cập Internet.
- Các PC trong mạng có thể *ping được với nhau*.
- Tạo **vlan 98** và **vlan 99** để **phòng IT** có thể truy cập (hoặc control) các switch (hoặc router) của **cả hai tòa nhà**.
- Cấu hình dự phòng cho **SW_Core** và **Router** của Tòa nhà B.
- Thiết lập sao cho **Home_PC** có thể truy cập được **Web_Server**.
- Thiết lập sao cho **Home_PC** có thể truy cập được **Database_Server**, thông qua **Tunel**.
- Cấu hình sao cho chỉ *phòng IT* và *phòng Giám đốc* có thể truy cập vào được *NAS_Server* của **Tòa nhà A**.


---------------------------------------------------------------------------------------------------------------------------
## Phân hoạch IP
|Tòa nhà| Phòng ban		| Số lượng host tối đa	| VLAN	| Lớp mạng		|
|-------|----------------------|------------------------------|-------|----------------------|
| A	| Kỹ thuật (KT) 	|	30 host		| 10	|	|
| A	| Showroom		|	50 host		| 50	|	|
| A	| Kho			|	10 host		| 15	|	|	
| A	| R&D			|	20 host		| 20	|	|
| B	| showroom		|	50 host		| 50	|	|
| B	| Marketing (MKT)	|	20 host		| 10	|	|
| B	|Customer experience (CX)|	30 host		| 15	|	|
| B	| Nhân sự (HR)		|	10 host		| 20	|	|
| B	| Sales		|	30 host		| 25	|	|
| B	| Guest		|	15 host		| 55	|	|
| B	| Kế toán		|	15 host		| 30	|	|
| B	| Giám đốc		|	10 host		| 35	|	|
| B	| IT			|	30 host		| 40	|	|






