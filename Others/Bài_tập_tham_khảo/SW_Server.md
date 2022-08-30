### VTP
```
(config)#vtp domain cisco.com
(config)#vtp password cisco
(config)#vtp version 2
(config)#vtp mode client
```

### EtherChannel
```
(config)#interface range ethernet 0/1 - 2 
(config-if-range)#switchport trunk encapsulation dot1q
(config-if-range)#channel-group 3 mode desirable 
(config-if-range)#exit
(config)#interface port-channel 3
(config-if)#switchport trunk encapsulation dot1q 
(config-if)#switchport mode trunk 
(config-if)#switchport trunk allowed vlan all
```

### Mode Access
```
(config)#interface range ethernet 0/0, ethernet 0/3
(config-if-range)#switchport mode access 
(config-if-range)#switchport access vlan 100
```

### Vlan 99 
```
(config)#interface vlan 99
(config-if)#no shutdown 
(config-if)#ip address 10.99.0.4 255.255.255.0
(config-if)#exit
(config)#ip default-gateway 10.99.0.1
```

