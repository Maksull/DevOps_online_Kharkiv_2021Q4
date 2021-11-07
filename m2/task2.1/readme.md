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
First of all I created virtual machine and **installed Ubuntu** on it:<br/>
![Create first VM](screenshots/Create%20first%20VM.png)

When you going to close the window with  virtual machine you will see three functions:
1. ***Save the machine state***: With this option, Oracle VM VirtualBox freezes the virtual machine by completely saving its state to your local disk.
2. ***Send the shutdown signal***: This will send an ACPI shutdown signal to the virtual machine, which has the same effect as if you had pressed the power button on a real computer. 
3. ***Power off the machine***: With this option, Oracle VM VirtualBox also stops running the virtual machine, but without saving its state.

Then I cloned it and **made group**, that contains these two machines:<br/>
![Cloning VM](screenshots/Cloning%20VM.png)<br/>
![Group with VMs](screenshots/Group%20with%20VMs.png)<br/>
To create group in command line you can use:<br/>
```
VBoxManage modifyvm "vm01" --groups "/TestGroup"<br/>
```
To detach vm from the group you can use:<br/>
```
VBoxManage modifyvm "vm01" --groups ""<br/>
```
Then I changed VM1_Yuhov and **add some snapshots**:
![Branched tree of snapshots](screenshots/Tree%20of%20snapshots.png)<br/>
Oracle VM VirtualBox can *import and export* virtual machines in the *OVF format*. *OVF* is a cross-platform standard supported by many virtualization products which enables the creation of ready-made virtual machines that can then be imported into a hypervisor. I **exported VM1 and imported Vm** from .ova file:
![Export process](screenshots/Export%20process.png)<br/>
![Import process](screenshots/Import%20process.png)<br/>
In order to **connect a USB flash drive** to the Virtual Machine, you first need to download and connect *Extension Pack*. After that choose VM and in the *setting/USB* add the USB:<br/>
![Connect USB to VM](screenshots/Connect%20USB%20to%20VM.png)<br/>
In order to **make the folder shared**, you need to select the Virtual Machine and *setting/shared folders*. Choose the folder. If you choose *read only*, then it will be impossible to change the folder on the host from the virtual machine. If you *do not choose Read only* the folder, you can change it:<br/>
![Shared directory](screenshots/Shared%20directory.png)<br/>
In order to add virtual machines to one network I: *Selected VM, settings, network, adapter, network bridge*. I used *ping* to check connection :<br/>
![Check connection](screenshots/Check%20%20connection.png)<br/>
The list command gives relevant information about your system and information about Oracle VM VirtualBox's current settings.
vms: Lists all virtual machines currently registered with Oracle VM VirtualBox. 
runningvms: Lists all currently running virtual machines by their unique identifiers (UUIDs) in the same format as with vms.
```
vboxmanage list vms
vboxmanage list running vms
```
![vboxmanage list vms list runningvms](screenshots/vboxmanage%20list%20vms%20list%20runningvms.png)<br/>
The showvminfo command shows information about a particular virtual machine.
```
vboxmanage showvminfo VM1_Yuhov
```
![vboxmanage showvminfo](screenshots/vboxmanage%20showvminfo.png)<br/>
The VBoxManage createvm command creates a new XML virtual machine definition file. You must specify the name of the VM by using --name name. The --ostype ostype option specifies the guest OS to run in the VM. The --register option registers the VM with your Oracle VM VirtualBox installation.
```
vboxmanage createvm --name ubuntu_test --ostype Ubuntu_64 --register
```
![vboxmanage createvm](screenshots/vboxmanage%20createvm.png)<br/>
You can change general settings through VBoxManage modifyvm. 
--cpus <cpucount>: Sets the number of virtual CPUs for the virtual machine
--memory <memorysize>: Sets the amount of RAM, in MB, that the virtual machine should allocate for itself from the host. 
--audio none|null|dsound|oss|alsa|pulse|coreaudio: Specifies whether the VM should have audio support, and if so, which type.
--usb on|off: Enables and disables the VM's virtual USB controller.
--acpi on|off and --ioapic on|off: Determines whether the VM has ACPI and I/O APIC support.
--boot<1-4> none|floppy|dvd|disk|net: Specifies the boot order for the virtual machine. 
--nic<1-N> none|null|nat|natnetwork|bridged|intnet|hostonly|generic: Configures the type of networking for each of the VM's virtual network cards. 
```
vboxmanage modifyvm ubuntu_test --cpus 1 --memory 512 --audio none  --usb off --acpi on --boot1 dvd --nic1 nat
```
![vboxmanage modifyvm](screenshots/vboxmanage%20modifyvm.png)<br/>
The startvm command starts a virtual machine that is currently in the Powered Off or Saved states. The optional --type specifier determines whether the machine will be started in a window or whether the output should go through VBoxHeadless
gui - Starts a VM showing a GUI window. This is the default.
headless - Starts a VM without a window for remote display only.
separate - Starts a VM with a detachable UI.
```
vboxmanage startvm ubuntu_test
```
![vboxmanage startvm](screenshots/vboxmanage%20startvm.png)<br/>
The VBoxManage clonevm command creates a clone of an existing virtual machine (VM). You must specify the name or the universal unique identifier (UUID) of the VM you want to clone.
-name=name Specifies a new name for the new VM. 
--register Automatically registers the new clone in this Oracle VM VirtualBox installation.
```
vboxmanage clonevm VM1_YUhov --name="VM1_Yuhov_clone" --register
```
![vboxmanage clonevm](screenshots/vboxmanage%20clonevm.png)<br/>
The VBoxManage *snapshot* command manages snapshots.
*VBoxManage snapshot <uuid|vmname> take <snapshot-name>* - takes a snapshot of the current state of the VM.
*VBoxManage snapshot <uuid|vmname> delete <snapshot-name>* - removes the specified snapshot.
*VBoxManage snapshot <uuid|vmname>* list - lists all the snapshots for a VM<br/>
![vboxmanage snapshot list](screenshots/vboxmanage%20snapshot%20list.png)<br/>
![vboxmanage take snap](screenshots/vboxmanage%20take%20snap.png)<br/>
![vboxmanage delete snap](screenshots/vboxmanage%20delete%20snap.png)<br/>
The **controlvm** subcommand enables you to change the state of a virtual machine that is currently running.
VBoxManage controlvm <vm> pause: Temporarily puts a virtual machine on hold, without permanently changing its state. 
VBoxManage controlvm <vm> savestate: Saves the current state of the VM to disk and then stops the VM.
![vboxmanage controlvm pause](screenshots/vboxmanage%20controlvm%20pause.png)<br/>
![vboxmanage controlvm savestate](screenshots/vboxmanage%20controlvm%20savestate.png)<br/>
