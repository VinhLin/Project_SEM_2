configure terminal

### Cấu hình để PING Internet
```
interface ethernet 0/1
ip address 10.199.199.2 255.255.255.0
```

### Gán IP cho Et0/0
```
interface ethernet 0/0
ip address 10.2.0.1 255.255.255.0
no shutdown 
```

### Cấu hình ra Internet
```
(config)#access-list 1 permit any
(config)#interface ethernet 0/1
(config-if)#ip nat outside 
(config-if)#exit
(config)#interface ethernet 0/0
(config-if)#ip nat inside
(config-if)#exit
(config)#ip route 0.0.0.0 0.0.0.0 10.199.199.1	// route ra default-gateway
(config)#ip nat inside source list 1 interface ethernet 0/1 overload
```

### Tunel
```
(config)#interface tunnel 1
(config-if)#tunnel source ethernet 0/1
(config-if)#tunnel destination 10.199.199.3
(config-if)#ip address 172.17.100.2 255.255.255.252
(config-if)#no shutdown
(config-if)#tunnel mode gre ip
```

### Cấu hình Routing để DHCP_Server có thể cấp được IP cho bên Chi nhánh
```
(config)#ip route 10.1.100.0 255.255.255.0 172.17.100.1
(config)#ip route 10.1.200.0 255.255.255.0 172.17.100.1
(config)#ip route 172.16.100.0 255.255.255.128 172.17.100.1
(config)#ip route 172.16.0.0 255.255.255.252 172.17.100.1
(config)#ip route 10.99.0.0 255.255.255.0 172.17.100.1
```

### Cấu hình DHCP-Relay cho cổng Et0/0
```
(config)#interface ethernet 0/0
(config-if)#ip helper-address 172.16.100.20
```

