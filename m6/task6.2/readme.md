*VM1* has two interfaces: **NAT and internal**   
![VM1 interfaces](screenshots/vm1_interfaces.png)   
*VM2* and *VM3* have one interface: **internal**  
![VM2 interfaces](screenshots/vm2_interfaces.png)  
![VM3 interfaces](screenshots/vm3_interfaces.png)  


CONFIGURE DHCP SERVER
--------------
<details><summary>USING VBOXMANAGE</summary>
  
The ```vboxmanage dhcpserver``` commands allow you to control the DHCP server that is built into VirtualBox.  
To *create a dhcp server* use:
```
vboxmanage dhcpserver add --netname intnet --ip 192.168.2.1 --netmask 255.255.255.0 --lowerip 192.168.2.30 --upperip 192.168.2.254 --enable
```
- ```--netname``` - the name of the network in VirtualBox
- ```-ip``` - IP adress for the dhcp server
- ```--lowerip --upperip``` - the range for the ip addresses that the dhcp can assign  

To see *the list of current dhcp servers* use:
```
vboxmanage list dhcpserver
```
![VBoxManage dhcpserver](screenshots/vboxmanage_configure_dhcp.png)  
To *change the setting* of the dhcpserver use ```vboxmanage dhcpserver modify```:
```
vboxmanage dhcpserver modify —netname mynet —lowerip 192.168.2.101 —upperip 192.168.2.120
```
![VBoxManage modify dhcpserver](screenshots/vboxmanage_modify_dhcp.png)  
The result:  
![VBoxManage dhcpserver](screenshots/vboxmanage_dhcp_result.png)  

</details>
