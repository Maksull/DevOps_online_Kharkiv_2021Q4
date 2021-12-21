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

<details><summary>USING ISC-DHCP-SERVER</summary>
   
First of all **stop the process of isc-dhcp-server**:
```
sudo service isc-dhcp-server stop
```
Set an interface that *connected with internal network* (enp0s8 in my case):  
```
sudo nano /etc/default/isc-dhcp-server
```
![ISC-DHCP-SERVER set an interface](screenshots/iscdhcp_set_interface.png)  
Configure the ***dhcp server***:
```
sudo nano /etc/dhcp/dhcpd.conf
```
![ISC-DHCP-SERVER configure dhcp](screenshots/iscdhcp_configure_dhcp.png)  
- ```range``` - the range for the ip addresses that the dhcp can assign
- ```option domain-name-servers``` - the IP adress of DNS server
- ```option domain-name``` - domain name
- ```option subnet-mask``` - the mask that will be given to the devices
- ```option routers``` - default gateway 
- ```option broadcast-address``` - the broadcast
- ```default-lease-time``` - this is the period for which the DHCP server assigns an IP address to the client
- ```max-lease-time``` - max period for which the DHCP server assigns an IP address to the client
  
In the end of the configuration **start the isc-dhcp-server**:
```
sudo service isc-dhcp-server start
```
The result:  
![ISC-DHCP-SERVER result](screenshots/iscdhcp_result.png)  

</details>
  
<details><summary>USING DNSMASQ</summary>
  
</details>

--------------









