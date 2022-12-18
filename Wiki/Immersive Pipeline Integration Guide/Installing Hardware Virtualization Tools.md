---
tags: [export, export-scrivener, revise]
prev: Hardware Control Surfaces and HID Devices
next: Installing Operating Systems From Scratch
---

If you need to run multiple operating systems on the same hardware you have multiple approaches that can be taken to solve this task. Virtualization is the creation of a "canister" like container that represents something that could be best described as a unique imaginary computer device that is simulated inside your active computer session. Each processor instruction call done inside the virtual machine is injected back into the real CPU processor using an approach called a hypervisor.

This approach allows you to use disk images to store the operating system and files. The virtual machine can support input devices, USB, audio, monitor connections, remote screen sharing, networking with controllable data routing options. A unique ethernet MAC ID address is assigned for each virtual machine network interface.

The virtual machine is able to be snapshotted, paused, resumed, reset, and shutdown as needed. The virtual machine session can be hosted locally or in the cloud, and it is even possible to transfer the location of a running virtual machine session between different data centers while it is still running.

One essential feature when working with graphics programs on a virtual machine instance is the support for native graphics rendering calls to the underlying hardware. This is called PCIe hardware passthrough support. It allows a virtualization environment to access native OpenGL, DirectX, OpenCL, CUDA, and Metal features that are able to work at peak performance often with less than 1-3% of a non-virtualized process running on the same hardware.

### Docker Containers

Docker Containers

<https://www.docker.com/>

For more information:

-   [Containers and Virtual Machines](https://www.docker.com/resources/what-container/)

### Install VIRSH + QEMU on Linux

Install VIRSH + QEMU on Linux

Linux distros have an amazing virtualization environment called [libVirt](https://libvirt.org) that can access PCIE hardware like GPUs, audio interfaces, and NVME storage via direct hardware passthrough of low-level devices.

It is possible to virtualize operating systems including Linux, Windows, and even macOS using VIRSH.

For more information:

-   [VIRSH](https://www.libvirt.org/manpages/virsh.html)
-   [Red Hat \| KVM Migration](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-kvm_live_migration-live_kvm_migration_with_virsh)

### Install VirtualBox on Linux

Install VirtualBox on Linux

VirtualBox is open-source virtual machine software developed by Oracle. It allows you to run Windows, Linux, and other operating systems from a disk image.

<https://www.virtualbox.org>

\# Download Virtual Box

sudo dnf install wget

cd \$HOME/Downloads/

wget <https://download.virtualbox.org/virtualbox/6.1.32/VirtualBox-6.1-6.1.32_149290_el8-1.x86_64.rpm>

\# Install the RPM package

sudo rpm -Uvh \$HOME/Downloads/VirtualBox-6.1-6.1.32_149290_el8-1.x86_64.rpm

\# Check for a possible EFI secure boot issue with modprobe and vboxdrv.

\# Restart the system. Hold down the delete key to enter BIOS.

\# Change the BIOS settings to:

\# BIOS \> Security \> Attempt Secure Boot \> Disabled.

\# Alternative approach - DNF Package Manager Based VirtualBox install

\# install

sudo dnf install VirtualBox-6.1 -y

\# Add yourself to the VirtualBox USB port sharing group

sudo usermod -a -G vboxusers Au

\# sudo usermod -a -G vboxusers vfx

\# Note: Look at adding \`whoami\` to the usermod string.

#### Start VirtualBox

Start VirtualBox

In a terminal window type in:

virtualbox

#### Create a new Virtual Machine

Create a new Virtual Machine

Click the "New" button in the VirtualBox toolbar.

Name: "Win10"

Type: "Microsoft Windows"

Version: "Windows 10 (64-bit)"

Click the "Next" button to continue.

Memory Size: 16384 MB

Click the "Next" button to continue.

#### Create Virtual Machine Dialog

Create Virtual Machine Dialog

Hard Disk

Click the "(x) Create a virtual hard disk now" option.

Then click on the "Create" button to continue.

Hard disk file type Dialog

Select the "(x) VMDK (Virtual Machine Disk)" option.

Click the "Next" button to continue.

Storage on physical hard disk

Select the "(x) Dynamically allocated" option.

Click the "Next" button to continue.

File size location

Type in "256 GB".

Click the "Create" button to continue.

At this point, a new "Win10" disk image will be listed in the "Oracle VM VirtualBox Manager" window.

#### Edit the VirtualBox VM Settings

Edit the VirtualBox VM Settings

Click the "Settings" button in the VirtualBox toolbar.

In the Win10 Settings dialog, click on the "Storage" icon on the left side of the dialog.

Select the item named "Empty". On the right side of the Storage tab, is an "Optical Drive" input field.

Click the small optical disc icon, then in the popup dialog select "Choose a disk file...".

Then select the Windows 10 ISO image named "**Win10_21H2_English_International_x64.iso**".

Click the "**OK**" button to continue. This will close the settings dialog.

#### Start the New Virtual Machine

Start the New Virtual Machine

Back in the main "Oracle VM VirtualBox Manager" window, press the "Start" button in the toolbar.

This will launch the new virtual machine with the Windows 10 installation media ISO connected to a virtual optical drive.

#### Eject the Windows Installation Media ISO

Eject the Windows Installation Media ISO

From the VirtualBox Menu at the top of the Win10 VM window, uncheck the "**Devices \> Optical Drives \> Win10_21H2_EnglishInternational_x64.iso**" menu item.

This will remove the installation media so the disk image is no longer accessible inside the Virtual Machine.

![[image1.png]]

#### Let's Create a VirtualBox Disk Snapshot

Let's Create a VirtualBox Disk Snapshot

Let's take a new snapshot of the current state of the virtual machine and it's virtual hard disk.

From the VirtualBox Menu at the top of the Win10 VM window, select the "**Machine \> Take Snapshot...**" menu item.

![[image260.png]]

#### Take Snapshot of Virtual Machine Dialog

Take Snapshot of Virtual Machine Dialog

In the "Take Snapshot of Virtual Machine" dialog enter the following parameters:

**Snapshot Name:** "Win10"

**Snapshot Description:** "Fresh Install"

Then click the "OK" button to close this window and save the snapshot to disk.

![[image251.png]]

A new disk snapshot will be saved to the .vmdk file. This can be thought of as something vaguely similar to a Windows "Restore Point" on a conventional PC.

![[image243.png]]

#### Backup a VMDK Disk Image to an External Disk or LTO Tape

Backup a VMDK Disk Image to an External Disk or LTO Tape

By default, your VirtualBox disk images are stored in disk at the default folder location of:

/home/vfx/VirtualBox VMs/

The newly created "Win10" disk image can be accessed using the \$HOME environment variable as:

\$HOME/VirtualBox VMs/Win10/

![[image6.png]]

#### Connect the VirtualBox Network Adapter

Connect the VirtualBox Network Adapter

Enable the "**Devices \> Network \> \[x\] Connect Network Adapte**r" option. This will allow Windows to connect to the internet and start downloading drivers and updates.

![[image38.png]]

#### Enable the VirtualBox Seamless Desktop Mode

Enable the VirtualBox Seamless Desktop Mode

The VirtualBox "View \> Seamless Mode" menu item allows you to use Windows and Linux together in a more transparent and user friendly fashion.

The "**Host +L**" hotkey for toggling On/OFF the "Seamless Mode" is typically configured as the "**Right Control + L**" hotkey combination when running with a default keyboard layout in Virtual Box.

![[image265.png]]

At the same time as the "Seamless Mode" is enabled in VirtualBox, it also helps to have a "Shared Folder" enabled in the VirtualBox preferences, too.

#### VirtualBox Snapshots Allow Incremental Disk Backups

VirtualBox Snapshots Allow Incremental Disk Backups

Use the VirtualBox "Machine \> Take Snapshot..." menu item to save a disk snapshot of the current .vmdk file.

![[image362.png]]

#### VirtualBox Shared Clipboard Copy/Paste Buffer

VirtualBox Shared Clipboard Copy/Paste Buffer

VirtualBox has a shared clipboard copy/paste feature that helps make the process of using Windows applications like web browsers and text editors seamless inside a Linux host OS based environment.

At the top of the VirtualBox window, select the "**Devices \> Shared Clipboard \> Bidirectional**" menu item. This turns on two way copying between Linux and Windows.

![[image3.png]]

You can also access this bidirectional clipboard option using the "**Win10 Settings \> General \> Advanced**" tab. In this view, you can set the "**Shared Clipboard:**" to "**Bidirectional**". Set the "**Drag 'n Drop:**" control to "**Bidirectional**" as well.

#### VirtualBox Shared Folders

VirtualBox Shared Folders

When you are working with Linux and Windows filesystems on the same host computer, it can be a big help to be able to pass files transparently between the two operating systems.

VirtualBox offers a "Shared Folder" option inside each virtual machine environment. You are able to choose the source folder on the host OS side, and the mount location inside the virtual machine where that content shows up.

It is also possible to decide if you want that shared folder location to be read-only which is useful in some cases if you don't want to have security risks like data being modified inside a Windows virtual machine used for software testing.

**Step 1.** Turn off the Windows session using the Windows 10 start menu "**Shutdown**" feature.

**Step 2.** In the VirtualBox software, where a "**VirtualBox Manager**" dialog shows all of the virtual machines, click on the left sidebar entry for "Win10". Then click in the toolbar on the orange colored "**Settings**" gearwheel icon.

![[image226.png]]

**Step 3.** This will open up the VirtualBox Settings dialog for that specific virtual machine session. On the left sidebar of this "**Win10 - Settings**" dialog, select the "**Shared Folder**" entry. Then click on the far top right corner of the Shared Folder's view on a small icon that shows a "**folder with + sign**" icon. This is the button used to add a new Linux to Windows shared folder location.

![[image91.png]]

**Step 4.** An "Add Share" dialog will appear. This is where you set up the folder sharing settings.

Click on the "**Folder Path**" pop-up menu, and choose the "**Other...**" option. Navigate to select your Linux home folder path which equates to "**\$HOME**".

![[image84.png]]

In the "Add Share" dialog, set the values to something roughly like this:

**Folder Path:** \\home\\vfx

**Folder Name:** vfx

\[x\] **Auto-mount** (enable the checkbox)

**Mount Point:** F:\\

**Step 5.** Then click the "**OK**" button to close this dialog. Back in the "Win10 - Settings" dialog, also click the "**OK**" button to close this dialog.

Step 6. Now you should be back in the "VirtualBox Manager" Window. Click on the Win10 virtual machine. Then press down in the center of the green "Start" button. This will re-launch the Windows 10 session.

![[image133.png]]

#### VirtualBox Display Settings

VirtualBox Display Settings

VirtualBox supports a wide range of GPU customizations that will increase the performance of the virtualized graphics. In the default compatibility mode we will use the "**Graphics Controller**" option of "**VBoxSVGA**".

In the "**Acceleration:**" section turn on the "**\[x\] Enable 3D Acceleration**" checkbox.

Drag the "**Video Memory:**" slider all the way to the right to select all the video memory we can allocate. This is typically "**256 MB**".

#### VirtualBox Audio Settings

VirtualBox Audio Settings

The "Host Audio Driver" pop-up menu is set to "**PulseAudio**".

Turn on the "**\[x\] Enable Audio Input**" and "**\[x\] Enable Audio Output**" checkboxes.

#### VirtualBox USB Settings

VirtualBox USB Settings

Change the VirtualBox settings to enable the "(**x) USB 3.0 (xHCI) Controller**".

We can also add any USB hardware we want to have permanently connected to the virtual machine in this window using the "USB Device Filters" list. The "**Blue Colored USB plug**" Icon on the far right of this window can be used to select each device that should be automatically connected to the VirtualBox instance at boot.

![[image11.png]]