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
## Yêu cầu Tổng quát
- Tạo kết nối **tunel** giữa *Tòa nhà A* và *Tòa nhà B*, để các PC giữa 2 tòa nhà có thể **ping** với nhau.
- Các PC trong cả 2 tòa nhà đều truy cập được Internet.
- Monitoring hệ thống.

### Tòa nhà A
- Phần *wifi_showroom* **chỉ được phép** truy cập Internet.
- Các PC trong mạng có thể **Ping được với nhau** và có thể **truy cập** vào được *Database_Server* và *Web_Server*.
- **NAS_Server** thì **chỉ** có *phòng R&D* là truy cập được.

### Tòa nhà B
- Phần **wifi_showroom** và phần **wifi_guest** chỉ được phép truy cập Internet.
- Các PC trong mạng có thể *ping được với nhau* và có thể **truy cập** vào được *Database_Server* và *Web_Server*.
- Tạo **vlan 99** để **phòng IT** có thể truy cập (hoặc control) các switch (hoặc router) của **cả hai tòa nhà**.
- Thiết lập sao cho **Home_PC** có thể truy cập được **Web_Server**.
- Thiết lập sao cho **Home_PC** có thể truy cập được **Database_Server**, thông qua **Tunel**.
- Thiết lập sao cho **Home_PC** có thể ping được với các PC trong phòng ban **IT**, thông qua **Tunel**.
- Cấu hình sao cho **Router DHCP_Server** cấp IP cho cả *Tòa nhà A* và *Tòa nhà B*.
- Cấu hình sao cho **chỉ** *phòng IT* và *phòng Giám đốc* có thể truy cập vào được *NAS_Server* của **Tòa nhà A**.
- Đảm bảo tính **HA** (High Available) cho *tòa nhà B*.


---------------------------------------------------------------------------------------------------------------------------
## Phân hoạch IP
### Phân hoạch dựa trên phòng ban và số nhân sự tối đa.
|Tòa nhà| Phòng ban		| Số lượng truy cập tối đa	| VLAN	| Lớp mạng		|
|-------|----------------------|--------------------------------|-------|----------------------|
| A	| Kỹ thuật lắp đặt (KT)|	30 người		| 10	|192.168.2.64/26|
| A	| Showroom A		|	50 người		| 15	|192.168.2.0/26	|
| A	| Kho			|	3 người		| 20	|192.168.2.144/29|	
| A	| R&D			|	10 người		| 25	|192.168.2.128/28|
| B	| showroom B		|	50 người		| 30	|192.168.0.0/26	|
| B	| Marketing (MKT)	|	10 người		| 35	|192.168.0.224/28 |
| B	|Customer experience (CX)|	15 người		| 40	|192.186.0.160/27 |
| B	| Nhân sự (HR)		|	5 người		| 45	|192.168.0.240/28 |
| B	| Sales			|	30 người		| 50	|192.168.0.64/26 |
| B	| Guest			|	15 người		| 55	|192.168.0.128/27 |
| B	| Kế toán		|	5 người		| 60	|192.168.3.216/29 |
| B	| Giám đốc		|	5 người		| 65	|192.168.3.224/29 |
| B	| IT			|	20 người		| 70	|192.168.0.192/27 |

### Phân hoạch VLAN để bên IT quản lý.
|VLAN	|	Note			|Số lượng host tối đa hiện tại|  Prefix	|
|-------|-----------------------------|--------------------------------|------------------|
|99	|Quản lý Switch và Router (MGMT)| [x]				| 172.16.3.0/25 |
|100	|Quản lý DHCP_Server		| 2 host			| 172.168.3.232/30 |
|101	|Quản lý Web_Server		| 2 host			| 172.16.3.192/29 |
|102	|Quản lý Database_Server	| 2 host			| 172.16.3.200/29 |
|103	|Quản lý Monitoring_Server	| 2 host			| 172.16.3.236/30 |
|104	|Quản lý NAS_Server		| 1 host			| 172.16.3.208/29 |

----------------------------------------------------------------------------------------------------------------------------
![Topology](https://github.com/VinhLin/Project_SEM_2/blob/main/Topology/Topology_Image.png)

-----------------------------------------------------------------------------------------------------------------------------
## Chi phí (Cost) dựa trên Topology

| Tên sản phẩm				| Đơn giá trên một thiết bị	|	Link tham khảo	|
|---------------------------------------|-------------------------------|-----------------------|
|Cisco Catalyst (WS-C2960X-24PS-L) 	| 20,000,000 VND 		|[ebay](https://www.ebay.com/p/219656613)|
|Router Cisco ISR4331/K9		| 49,000,000 VND		|[ebay](https://www.ebay.com/p/19034357944?iid=195214416396)|
|Cisco Catalyst WS-C3850-24T-L 		| 56,500,000 VND		|[sieuthimaychu](https://www.sieuthimaychu.vn/index.php/Thong_Tin_San_Pham/7193/Cisco-Catalyst-WS-C3850-24T-L-)|
|PfSense Firewall C2358 2-Core 6 LAN	| 42,000,000 VND		|[ebay](https://www.ebay.com/itm/115462068500?hash=item1ae2135914:g:nHEAAOSw6aJizPRQ)|


|Tòa nhà | Số lượng		| Chi phí	|
|--------|----------------------|---------------|
|A	| 2 switch layer 2 	|  40,000,000 VND |
|A	| 1 Switch Core	layer 3	|  56,500,000 VND |
|A	| 1 Firewall		|  42,000,000 VND |
|B	| 6 Switch layer 2	|  120,000,000 VND |
|B	| 2 Switch Core	layer 3	|  113,000,000 VND |
|B	| 1 Router		|  49,000,000 VND |
|B	| 2 Firewall		|  84,000,000 VND |

### Tổng chi phí của tòa A: 138,500,000 VND
### Tổng chi phí của tòa B: 366,000,000 VND	





