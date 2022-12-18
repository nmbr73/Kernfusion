---
tags: [export, export-scrivener, revise]
prev: Pixar Tractor Deployment
next: Installing Digital Content Creation Apps
---

### Install AnyDesk Screen Sharing on Linux

Install AnyDesk Screen Sharing on Linux

AnyDesk is a remote access tool which allows for system administration tasks to be done via screen sharing. It can tunnel a remote connection through a firewall if required.

<https://www.anydesk.com/>

\# Add a new AnyDesk repo entry

cat \> /etc/yum.repos.d/AnyDesk-RHEL.repo \<\< "EOF"

\[anydesk\]

name=AnyDesk RHEL - stable

baseurl=http://rpm.anydesk.com/rhel/$releasever/$basearch/

gpgcheck=1

repo_gpgcheck=1

gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY

EOF

\# Add Anydesk using the DNF package manager

sudo dnf install anydesk

### Install TeamViewer Screen Sharing on Windows/macOS

Install TeamViewer Screen Sharing on Windows/macOS

<https://www.teamviewer.com/en/>

### Install Parsec Screen Sharing on Windows

Install Parsec Screen Sharing on Windows

<https://parsec.app/>

### Install RealVNC Screen Sharing on Windows

Install RealVNC Screen Sharing on Windows

<https://www.realvnc.com/en/>

For more information:

-   <https://www.realvnc.com/en/connect/download/vnc/>

### Install Steam on Linux

Install Steam on Linux

<https://www.dedoimedo.com/computers/rocky-linux-8-steam.html>

### Remote Keyboard and Mouse Sharing with Synergy

Remote Keyboard and Mouse Sharing with Synergy

Through the magic of [Synergy keyboard/mouse sharing](https://symless.com/synergy) it is possible to track the mouse pointer seamlessly across the two or more systems, regardless of the host OS platform.

This can remove the need to juggle multiple keyboards on the same desk if you need to manage Windows, Linux, and macOS systems as part of your daily activities.

![[image97.png]]

### Sharing a Microsoft Windows Keyboard with a macOS System Using Windows Key vs Command Key Remapping

Sharing a Microsoft Windows Keyboard with a macOS System Using Windows Key vs Command Key Remapping

![[image157.png]]

### VirtualHere Network-Based USB Device Sharing

VirtualHere Network-Based USB Device Sharing

If you have several fixed USB licensing dongles that you need to be able to float between several different computers, then the VirtualHere software is a miracle for your problems.

<https://www.virtualhere.com/>

One thing to keep in mind when buying a VirtualHere license is that the host server program is a perpetual licensed program but it is tied to one fixed host system ID and no license migrations are provided. Ever.

### Sharp Keys Based Keyboard Remapping for Windows

Sharp Keys Based Keyboard Remapping for Windows

The Sharp Keys utility for Windows is excellent if you need to modify the default key bindings of a specific key on your keyboard. This is typically required when using a macOS keyboard with Control/Option/Command keys connected to a remote access session hosted on a Windows PC.

[Microsoft App Store \| SharpKeys](https://apps.microsoft.com/store/detail/sharpkeys/XPFFCG7M673D4F)

You have a useful option with the Sharp Keys utility of being able modify both the left and right side "Windows" keys on your keyboard to an alternative kep mapping.

![[image225.png]]

Or you could choose to bind only a single Windows key (like the left Windows key) to an alternative key mapping. This allows you the flexibility to occasionally access the original unmodified right Windows key.

![[image327.png]]

### Install Meta QuestLink / AirLink Drivers on Windows

Install Meta QuestLink / AirLink Drivers on Windows

Please see guide "Kartaverse Workflows \| SketchFab in VR Via QuestLink"

<https://docs.google.com/document/d/1sWkv5H7ZAM1SnqrEXYRL3kBKnvjqmDjKTA9v9ObN490/edit>

![[image215.png]]

### Windows System Internals Utilities

Windows System Internals Utilities

<https://learn.microsoft.com/en-us/sysinternals/downloads/>