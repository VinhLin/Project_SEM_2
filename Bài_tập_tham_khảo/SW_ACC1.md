### VTP
```
(config)#vtp domain cisco.com
(config)#vtp password cisco
(config)#vtp version 2
(config)#vtp mode client
```

### EtherChannel
```
(config)#interface range ethernet 1/0 - 1 
(config-if-range)#switchport trunk encapsulation dot1q
(config-if-range)#channel-group 1 mode desirable 
(config-if-range)#exit
(config)#interface port-channel 1
(config-if)#switchport trunk encapsulation dot1q 
(config-if)#switchport mode trunk 
(config-if)#switchport trunk allowed vlan all
```

### Trunk Et0/0
```
(config)#interface ethernet 0/0
(config-if)#switchport trunk encapsulation dot1q
(config-if)#switchport mode trunk
(config-if)#switchport trunk allowed vlan all
```

### Mode Access
```
(config)#interface range ethernet 0/1 - 2 
(config-if-range)#switchport mode access 
(config-if-range)#switchport access vlan 10
```

### Vlan 99 
```
(config)#interface vlan 99
(config-if)#ip address 10.99.0.2 255.255.255.0
(config-if)#no shutdown 
(config-if)#exit
(config)#ip default-gateway 10.99.0.1
```


