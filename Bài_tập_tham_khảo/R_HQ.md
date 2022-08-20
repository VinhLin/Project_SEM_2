configure terminal

### Cấu hình để PING Internet
```
interface ethernet 0/1
ip address 10.199.199.3 255.255.255.0
no shutdown
do ping 10.199.199.1
do ping 10.199.199.2
```

(config)#ip route 0.0.0.0 0.0.0.0 10.199.199.1

### Cấu hình cho cổng Et0/0
```
(config)#interface ethernet 0/0
(config-if)#ip address 172.16.0.1 255.255.255.252
(config-if)#no shutdown 
```

### NAT
```
(config)#interface ethernet 0/1
(config-if)#ip nat outside 
(config-if)#exit
(config)#interface ethernet 0/0
(config-if)#ip nat inside 
```

### ACL
- Chỉ cho phép Vlan 10, 20, 100 là được phép đi Internet.
- Vlan 99 không đc phép đi Internet.
```
(config)#access-list 1 remark -- Connect to Internet --
(config)#access-list 1 permit 10.1.100.0 0.0.0.255
(config)#access-list 1 permit 10.1.200.0 0.0.0.255
(config)#access-list 1 permit 172.16.100.0 0.0.0.127
(config)#access-list 1 deny any 
```
(config)#ip nat inside source list 1 interface ethernet 0/1 overload

### Static Route
```
(config)#ip route 10.1.100.0 255.255.255.0 172.16.0.2
(config)#ip route 10.1.200.0 255.255.255.0 172.16.0.2
(config)#ip route 172.16.100.0 255.255.255.128 172.16.0.2 
```

### Tunel
```
(config)#interface tunnel 1
(config-if)#tunnel source ethernet 0/1
(config-if)#tunnel destination 10.199.199.2
(config-if)#ip address 172.17.100.1 255.255.255.252
(config-if)#no shutdown
(config-if)#tunnel mode gre ip
```

### Routing thông qua Tunel
(config)#ip route 10.2.0.0 255.255.255.0 172.17.100.2


