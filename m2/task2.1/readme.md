The most popular hypervisors for infrastructure virtualization:<br />
1. Microsoft Hyper-V
2. Oracle VirtualBox
3. VMware
4. Citrix XenServer
5. Parallels Hypervisor
6. Red Hat Enterprise Virtualization

--------------

There are **two main hypervisor types**, referred to as "Type 1"(or *bare metal*) and "Type 2"(or *hosted*). A **type 1 hypervisor** acts like a lightweight operating system and runs directly on the host's hardware, while a **type 2 hypervisor** runs as a software layer on an operating system, like other computer programs.

***Hyper-V vs VirtualBox***<br/>
**Hyper-V** is a type 1 hypervisor while **VirtualBox** is a type 2 hypervisor. **Hyper-V** can only be installed on Windows-based systems, while **VirtualBox** is a multiplatform product.

***Hyper-V vs VMware*** <br/>
**Hyper-V** is a type 1 hypervisor while **VMware** is a type 2 hypervisor.**Hyper-V** uses a single memory technique called “Dynamic Memory.” Using the dynamic memory settings, **Hyper-V** virtual machine memory can be added or released from the virtual machine back to the **Hyper-V** host. VMware implements a variety of techniques, such as memory compression and transparent page sharing, to ensure that RAM use in the VM is optimized. It is a more complex system than Hyper-V’s memory technique.
