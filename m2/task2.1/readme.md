# PART 1

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

***VMware vs VirtualBox*** <br/>
**VMware** offers virtualization at the hardware level. **VirtualBox** offers virtualization at both hardware and software levels. **VMware** offers ease of access to the users. **VirtualBox** does not allow ease of access as compared to **VMware**.

------------------

# PART 2
First of all I created virtual machine and installed Ubuntu on it:<br/>
![Create first VM](/screenshots/Create%20first%20VM.png)

When you going to close the window with  virtual machine you will see three functions:
Save the machine state: With this option, Oracle VM VirtualBox freezes the virtual machine by completely saving its state to your local disk.
Send the shutdown signal. This will send an ACPI shutdown signal to the virtual machine, which has the same effect as if you had pressed the power button on a real computer. 
Power off the machine: With this option, Oracle VM VirtualBox also stops running the virtual machine, but without saving its state.

Then I cloned it and made group, that contains these two machines:<br/>
![Cloning VM](/screenshots/Cloning%20VM.png)<br/>
![Group with VMs](/screenshots/Group%20with%20VMs.png)<br/>
To create group in command line you can use:
VBoxManage modifyvm "vm01" --groups "/TestGroup"
To detach vm from the group you can use:
VBoxManage modifyvm "vm01" --groups ""
