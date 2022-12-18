---
tags: [export, export-scrivener, revise]
prev: Installing Operating Systems From Scratch
next: System Admin Resources
---

### Balena Etcher

Balena Etcher

A cross-platform compatible bootable Linux OS disk image cloning tool.

<https://etcherofficial.com/>

![[image51.png]]

### Rescuezilla Bare Metal Disk Imaging, Backups and Restores

Rescuezilla Bare Metal Disk Imaging, Backups and Restores

Install Rescuezilla

**Step 1.** Go to the [Rescuezilla](https://rescuezilla.com/download) download page, and download the "rescuezilla-2.3.1-64bit.impish.iso" file to disk.

**Step 2.** Download and Install [Balena Etcher](https://www.balena.io/etcher/), or a similar disk image recording tool.

**Step 3**. Use Balena Etcher to record the "rescuezilla-2.3.1-64bit.impish.iso" to an external USB thumbstick or memory card.

Disk to Disk Clone

A 500gb NVME can be copied disk to disk in 5 minutes with [Rescuezilla](https://rescuezilla.com). This tool is a GUI and mouse driven version of the earlier text console based [Clonezilla](https://clonezilla.org/clonezilla-live.php) bootable disk management and backup utility.

Boot windows once and then choose restart to switch over to rescuezilla. This removes the windows hibernation file.

In gparted, if a small partition is spaced out at the far end of the disk you need to use the "move partition" function to bring the selected disk partition inwards, towards the left of the active disk partitions, to be able to fully shrink down a large ext4 or NTFS formatted NVME's storage space usage. This allows you to clone the data onto a smaller hard disk.

You can't resize a partition larger if the "free space" zone is sandwiched on the opposite side of another partition block. In that case, you can slide/move the partition you don't need to make larger, out of the way, to the far right end of a disk.

Rescuezilla Workflow Essentials

-   Move the server to a workbench.
-   Insert the Rescuezilla USB thumbdrive media.
-   Turn on the render node.
-   Press F11 to switch the OS selection over to boot Windows. Restart immediately to Linux Rescuezilla so there is no hibernation image
-   Press F11 at boot to switch the boot OS to Rescuezilla.
-   Select "English" language
-   Select "Graphical Fallback Mode"
-   Using gparted, move the blocking partitions out of the way, then resize the data partitions smaller to fit on a smaller drive.
-   Rescuezilla - clone big disk to smaller disk
-   Using gparted, expand the data partition on cloned drive
-   Shutdown the render node and remove the large NVME, and the Rescuezilla USB thumbdrive media.
-   Turn on the render node
-   Press delete at BIOS and set the boot volume to the 500 GB NVME system.
-   Wait 1 minute from power on for the 10G ethernet to power up and for the OS to finish booting.
-   Restart Windows once to check everything is working as expected.
-   Power off the server and insert the HDMI dummy video adapter dongle.
-   Redeploy the server back to regular operations in the rack.

### Linux BootRepair Utility

Linux BootRepair Utility

If you have issues after installing, upgrading, or cloning a BIOS or UEFI based Linux GRUB bootloader setup you might need to use the BootRepair utility to help fix broken Linux boot configurations. It is available in most Linux Software Manager utilities.

Yes, it is also possible to carry out the same commands fully from a terminal session, but sometimes late in the night between midnight to 2 AM when GRUB most often fails on you, it might be nice to have a Live Image of a Linux distro on a USB thumbdrive along with a Boot-Repair GUI available to try and fix things.

![[image17.png]]

### Installing the Canister LTO Backup Tool

Installing the Canister LTO Backup Tool

Hedge Canister is a macOS based LTO tape backup program that makes creating long-term offline backups easy and reliable. It works with SAS + Thunderbolt connected tape drives on macOS Intel and ARM64 compatible systems.

<https://hedge.video/canister>

![[image123.png]]

This is what a typical LTO SAS tape drive looks like. This unit is an HP Enterprise Ultrium drive in an external enclosure. It has SAS connectors on the back that are used to connect to a file server.

![[image346.jpg]]

When choosing hardware, it is handy to know that Apple macMini systems make a very affordable macOS based host for an LTO drive. You will want to add 10Gb Ethernet to the macMini via a Thunderbolt solution if the computer doesn't natively have 10Gb Ethernet onboard.

If you need to connect a SAS based LTO tape drive to a macOS based host system you can use an OWC Mercury Helios 3 Thunderbolt 3 PCIe enclosure to host an ATTO SAS based PCIe card. It takes a bit of research to gather all the required cabling and SAS adapters if you haven't used gear with the SAS protocol before.

![[image5.jpg]]

LTO Tapes have a long archival shelf-life if stored according to manufacturer's instructions in the proper environmental conditions. LTO tapes are typically ordered in box sizes of 5-tape cartridges at a time.

![[image95.jpg]]