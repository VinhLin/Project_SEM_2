configure terminal
hostname SW_Core

### Bật chức năng Routing trên Switch Layer 3
(config)#ip routing

### VTP
```
(config)#vtp domain cisco.com
(config)#vtp password cisco
(config)#vtp version 2
(config)#vtp mode server
(config)#vlan 10 
(config-vlan)#name IT
(config)#vlan 20
(config-vlan)#name User
(config)#vlan 99
(config-vlan)#name MGMT
(config)#vlan 100
(config-vlan)#name Server
```

### EtherChannel
```
(config)#interface range ethernet 1/0 - 1
(config-if-range)#shutdown
(config-if-range)#channel-group 1 mode desirable 
(config-if-range)#no shutdown
(config-if-range)#switchport trunk encapsulation dot1q
(config-if-range)#exit
(config)#interface port-channel 1
(config-if)#switchport trunk encapsulation dot1q 
(config-if)#switchport mode trunk
(config-if)#switchport trunk allowed vlan all 
(config)#interface range ethernet 1/2 - 3
(config-if-range)#channel-group 2 mode desirable 
(config-if-range)#switchport trunk encapsulation dot1q
(config-if-range)#exit
(config)#interface port-channel 2
(config-if)#switchport trunk encapsulation dot1q 
(config-if)#switchport mode trunk 
(config-if)#switchport trunk allowed vlan all
(config)#interface range ethernet 0/1 - 2
(config-if-range)#channel-group 3 mode desirable 
(config-if-range)#switchport trunk encapsulation dot1q
(config-if-range)#exit
(config)#interface port-channel 3
(config-if)#switchport trunk encapsulation dot1q 
(config-if)#switchport mode trunk 
(config-if)#switchport trunk allowed vlan all
```

### Spanning-tree
```
(config)#spanning-tree mode pvst
(config)#spanning-tree vlan 1 root primary
```

### Routing
(config)#ip route 0.0.0.0 0.0.0.0 172.16.0.1

### Vlan 99
```
(config)#interface vlan 99
(config-if)#ip address 10.99.0.1 255.255.255.0
(config-if)#no shutdown 
(config)#ip default-gateway 10.99.0.1
```

### Vlan 98 - Connect Router
```
(config)#vlan 98
(config-vlan)#name Connect_R_HQ
(config-vlan)#exit
config)#interface vlan 98
(config-vlan)#name Connect_R_HQ
(config-if)#ip address 172.16.0.2 255.255.255.252
(config-if)#no shutdown 
(config-if)#exit
(config)#interface ethernet 0/0
(config-if)#switchport mode access 
(config-if)#switchport access vlan 98
(config-if)#do ping 172.16.0.1 source vlan 98
```

### Vlan 100
```
(config)#interface vlan 100
(config-if)#ip address 172.16.100.1 255.255.255.128
(config-if)#no shutdown 
```

### Vlan 10
```
(config)#interface vlan 10
(config-if)#ip address 10.1.100.1 255.255.255.0
(config-if)#no shutdown 
```

### Vlan 20
```
(config)#interface vlan 20
(config-if)#ip address 10.1.200.1 255.255.255.0
(config-if)#no shutdown 
```

## DHCP Relay (IP Helper)
### DHCP Relay for Vlan 10
```
(config)#interface vlan 10
(config-if)#ip helper-address 172.16.100.20
### DHCP Relay for Vlan 20
(config)#interface vlan 20
(config-if)#ip helper-address 172.16.100.20
```


