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
|Tòa nhà| Phòng ban		| Số lượng truy cập tối đa	| VLAN	| Lớp mạng		|
|-------|----------------------|--------------------------------|-------|----------------------|
| A	| Kỹ thuật lắp đặt (KT)|	30 người		| 10	|192.168.2.64/26|
| A	| Showroom A		|	50 người		| 15	|192.168.2.0/26	|
| A	| Kho			|	3 người		| 20	|192.168.2.144/29|	
| A	| R&D			|	10 người		| 25	|192.168.2.128/28|
| B	| showroom B		|	50 người		| 30	|192.168.0.0/26	|
| B	| Marketing (MKT)	|	10 người		| 35	|192.168.0.224/28 |
| B	|Customer experience (CX)|	15 người		| 40	|192.168.0.160/27 |
| B	| Nhân sự (HR)		|	5 người		| 45	|192.168.0.240/28 |
| B	| Sales			|	30 người		| 50	|192.168.0.64/26 |
| B	| Guest			|	15 người		| 55	|192.168.0.128/27 |
| B	| Kế toán		|	5 người		| 60	|192.168.1.216/29 |
| B	| Giám đốc		|	5 người		| 65	|192.168.1.224/29 |
| B	| IT			|	20 người		| 70	|192.168.0.192/27 |

### Phân hoạch VLAN để bên IT quản lý.
|VLAN	|	Note			|Số lượng host tối đa hiện tại|  Prefix	|
|-------|-----------------------------|--------------------------------|------------------|
|98	|Quản lý Router		| [x]				| 192.168.1.128/26 |
|99	|Quản lý Switch		| [x]				| 192.168.1.0/25 |
|100	|Quản lý DHCP_Server		| 2 host			| 192.168.1.232/30 |
|101	|Quản lý Web_Server		| 2 host			| 192.168.1.192/29 |
|102	|Quản lý Database_Server	| 2 host			| 192.168.1.200/29 |
|103	|Quản lý Monitoring_Server	| 2 host			| 192.168.1.236/30 |
|104	|Quản lý NAS_Server		| 1 host			| 192.168.1.208/29 |

----------------------------------------------------------------------------------------------------------------------------
![Topology](https://github.com/VinhLin/Project_SEM_2/blob/main/Topology/Topology_Image.png)

-----------------------------------------------------------------------------------------------------------------------------
## Chi phí (Cost) dựa trên Topology

| Tên sản phẩm			| Đơn giá trên một thiết bị	|	Link tham khảo	|
|-------------------------------|-------------------------------|-----------------------|
|Switch Cisco Layer 2 (24 port)	| 9,199,000 VND 		|[anphatpc](https://www.anphatpc.com.vn/switch-cisco-ws-c296024tc-s-24-port-combo_id18779.html)|
|Router Cisco 1921		| 10,800,000 VND		|[tiki](https://tiki.vn/bo-dinh-tuyen-router-cisco-1921k9-2-ge-2-khe-cam-ehwic-512dram-ip-base-hang-chinh-hang-p50476546.html?spid=50476547&utm_source=google&utm_medium=cpc&utm_campaign=SEA_NBR_GGL_SMA_DTP_ALL_VN_ALL_UNK_UNK_C.ALL_X.10625984610_Y.106657549162_V.50476547_W.c_A.1392449951176_O.UNK&gclid=CjwKCAjwpKyYBhB7EiwAU2Hn2fcKlJeKL7HBcfheocsJq20K-oZTA6OmjWr_rWEpaN9Wu7ZlWtm77hoCEqoQAvD_BwE)|
|Cisco WS-C3560-24TS-S Catalyst 3560 24Port| 24,200,000 VND	|[thietbimangcisco](https://thietbimangcisco.vn/bang-gia-switch-cisco-catalyst-3560-3650-3750x-3850-moi-nhat-2018-v-322-332-5237.html)|
|PfSense Firewall C2358 2-Core 6 LAN| 17,558,250 VND ($750)	|[corpshadow](https://corpshadow.biz/pfsense/pffw2700?gclid=CjwKCAjwpKyYBhB7EiwAU2Hn2SzXTH5LaCkjXJ3_CowljskdRtPIWYGiF5hx1PIfakDovUTyXQ6P0xoCKN8QAvD_BwE)|


|Tòa nhà | Số lượng		| Chi phí	|
|--------|----------------------|---------------|
|A	| 3 switch layer 2 	| 27,597,000 VND |
|A	| 1 Switch Core		| 24,200,000 VND |
|A	| 2 Router		| 21,600,000 VND |
|B	| 6 Switch layer 2	| 55,194,000 VND |
|B	| 2 Switch Core		| 48,400,000 VND |
|B	| 2 Router		| 21,600,000 VND |
|B	| 2 Firewall		| 35,122,500 VND |

### Tổng chi phí của tòa A: 73,397,000 VND
### Tổng chi phí của tòa B: 160,316,500 VND	
