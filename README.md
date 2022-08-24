# Project_SEM_2
Lab project Jetking SEM2.

--------------------------------------------------------------------------------------------------------------------------
## Bảng phân công công việc.

https://docs.google.com/spreadsheets/d/1Qv2cCKSXS4DtV4rxd2ezQ3oRR3AkluJIYRX271ewn3E/edit#gid=0

### Lưu ý:
- Mỗi thành viên trong nhóm khi hoàn thành xong task, và đánh dấu trạng thái DONE trong **bảng phân công nhiệm vụ**.
- Đối với các config thiết bị, cần copy phần **running** ra file *txt* và push lên Git, trong thư mục `Topology/Config_Device`.
- Ngoài ra nếu có thể thì nên screenshot lại kết quả đạt được khi cấu hình xong và copy vào thư mục `Image`.

--------------------------------------------------------------------------------------------------------------------------
## Yêu cầu
- Tạo kết nối **tunel** giữa *Tòa nhà A* và *Tòa nhà B*, để các PC giữa 2 tòa nhà có thể **ping** với nhau.
- Các PC trong cả 2 tòa nhà đều truy cập được Internet.
- Monitoring hệ thống.

### Tòa nhà A
- Phần **wifi_showroom** chỉ được phép truy cập Internet.
- Các PC trong mạng có thể **Ping được với nhau** và có thể **truy cập** vào được *Database_Server* và *Web_Server*.
- **NAS_Server** thì chỉ có *phòng R&D* là truy cập được.
- Cấu hình dự phòng **gateway** cho Router của *Tòa nhà A*.

### Tòa nhà B
- Phần **wifi_showroom** và phần **wifi_guest** chỉ được phép truy cập Internet.
- Các PC trong mạng có thể *ping được với nhau* và có thể **truy cập** vào được *Database_Server* và *Web_Server*.
- Tạo **vlan 98** và **vlan 99** để **phòng IT** có thể truy cập (hoặc control) các switch (hoặc router) của **cả hai tòa nhà**.
- Cấu hình dự phòng cho **SW_Core** và **Router** của Tòa nhà B.
- Thiết lập sao cho **Home_PC** có thể truy cập được **Web_Server**.
- Thiết lập sao cho **Home_PC** có thể truy cập được **Database_Server**, thông qua **Tunel**.
- Thiết lập sao cho **Home_PC** có thể ping được với các PC trong phòng ban **IT**, thông qua **Tunel**.
- Cấu hình sao cho **Router DHCP_Server** cấp IP cho cả *Tòa nhà A* và *Tòa nhà B*.
- Cấu hình sao cho chỉ *phòng IT* và *phòng Giám đốc* có thể truy cập vào được *NAS_Server* của **Tòa nhà A**.


---------------------------------------------------------------------------------------------------------------------------
## Phân hoạch IP
### Phân hoạch dựa trên phòng ban và số nhân sự tối đa.
|Tòa nhà| Phòng ban		| Số lượng nhân sự tối đa	| VLAN	| Lớp mạng		|
|-------|----------------------|------------------------------|-------|----------------------|
| A	| Kỹ thuật lắp đặt (KT)|	30 người		| 10	|	|
| A	| Showroom A		|	50 người		| 15	|	|
| A	| Kho			|	3 người		| 20	|	|	
| A	| R&D			|	10 người		| 25	|	|
| B	| showroom B		|	50 người		| 30	|	|
| B	| Marketing (MKT)	|	10 người		| 35	|	|
| B	|Customer experience (CX)|	15 người		| 40	|	|
| B	| Nhân sự (HR)		|	5 người		| 45	|	|
| B	| Sales		|	30 người		| 50	|	|
| B	| Guest		|	15 người		| 55	|	|
| B	| Kế toán		|	5 người		| 60	|	|
| B	| Giám đốc		|	5 người		| 65	|	|
| B	| IT			|	20 người		| 70	|	|

### Phân hoạch VLAN để bên IT quản lý.
|VLAN	|	Note			|	Số lượng host tối đa	|  Prefix	|
|-------|-----------------------------|------------------------------|---------------|
|98	|Quản lý Router		| [x]				| /24		|
|99	|Quản lý Switch		| [x]				| /24		|
|100	|Quản lý DHCP_Server		| 2 host			| /30 		|
|101	|Quản lý Web_Server		| 2 host			| /30 		|
|102	|Quản lý Database_Server	| 2 host			| /30 		|
|103	|Quản lý Monitoring_Server	| 2 host			| /30 		|
|104	|Quản lý NAS_Server		| 1 host			| /30 		|

----------------------------------------------------------------------------------------------------------------------------
![Topology](https://github.com/VinhLin/Project_SEM_2/blob/main/Topology/Topology_Image.png)


