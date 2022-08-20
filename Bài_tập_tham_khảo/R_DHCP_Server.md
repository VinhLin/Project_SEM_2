### Set IP for Et0/0
```
(config)#interface ethernet 0/0
(config-if)#ip address 172.16.100.20 255.255.255.128
(config-if)#no shutdown
```

### Routing
(config)#ip route 0.0.0.0 0.0.0.0 172.16.100.1

## DHCP
```
(config)#ip dhcp excluded-address 10.1.100.1 10.1.100.49
(config)#ip dhcp excluded-address 10.1.200.1 10.1.200.49
(config)#ip dhcp excluded-address 10.2.0.1 10.2.0.49
```
### DHCP for Vlan 10
```
(config)#ip dhcp pool DHCP_VLAN10_IT
(dhcp-config)#network 10.1.100.0 255.255.255.0
(dhcp-config)#default-router 10.1.100.1
(dhcp-config)#dns-server 8.8.8.8
```
### DHCP for Vlan 20
```
(config)#ip dhcp pool DHCP_VLAN20_USER
(dhcp-config)#network 10.1.200.0 255.255.255.0
(dhcp-config)#default-router 10.1.200.1
(dhcp-config)#dns-server 8.8.8.8
```
### DHCP for CN1
```
(config)#ip dhcp pool DHCP_CN1
(dhcp-config)#network 10.2.0.0 255.255.255.0
(dhcp-config)#default-router 10.2.0.1
(dhcp-config)#dns-server 8.8.8.8
```


