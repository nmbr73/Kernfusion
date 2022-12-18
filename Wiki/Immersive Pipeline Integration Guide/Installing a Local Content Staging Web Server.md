A local content staging server allows you to create new revisions to a website without breaking the existing live website.

If you want to work with large media files and develop content that will eventually be played back from a web server it is very important to do extensive local testing with a copy of your website content and web server tools.

Spending a lot of time to upload and then re-download web site content over-and-over again during your ongoing development and testing phases is often time wasted.

### Google WebFonts

Google WebFonts

<https://www.fonts.com/web-fonts/google>

### Installing nodeJS, npm, electron, and shellJS

Installing nodeJS, npm, electron, and shellJS

<https://nodejs.org/>

<https://www.electronjs.org/>

<https://www.npmjs.com/package/shelljs>

### Installing MAMP on macOS and Windows

Installing MAMP on macOS and Windows

If you are using macOS or Windows the easiest web sharing module to set up and install is MAMP. For local testing the MAMP program is likely all you need and you can skip running MAMP Pro.

No discussion of web sharing programs would be complete without a brief suggestion that you talk with your system administrator about network security and firewalls before enabling an Apache web sharing mode on your system. You may also want to research Apache .htaccess files to learn how to lock down the htdocs sharing folder to only allow access from users with a specific realm login account and password.

Step 1. Start by downloading and installing MAMP.

On Windows MAMP is installed on your hard disk at:

C:\\MAMP\\MAMP.exe

On macOS MAMP is installed on your hard disk at:

/Applications/MAMP/MAMP.app

Step 2. Launch MAMP for the first time. An easy to use GUI will appear.

![[image206.png]]

On the right side of the MAMP window is a button with a circular "power" icon that lets you Start and Stop the MAMP server. Click the Start Servers button if the MAMP server is not running yet.

On the left side of the MAMP window is a "Preferences" button that will open up the Apache server controls. Click the Preferences button.

Step 3. The Preferences window allows you to control the Apache server settings without having to manually edit any configuration files.

Enable the "Start Servers when starting MAMP" and "Stop Servers when quitting MAMP" checkboxes in the Start/Stop tab.

Turning on these two controls means you can easily use MAMP when you want to view locally served html content. Then when you have finished with that task you can quit the MAMP GUI, and MAMP will then immediately stop the Apache web sharing background system service.

![[image105.png]]

There are several other settings in the MAMP preferences window you could adjust if you wanted to.

Step 4. Click on the Ports tab in the MAMP preferences window. The Ports tab allows you to change the default server port settings for the Apache web sharing.

![[image305.png]]

On Windows the Apache Port is set to 80 by default. This is the typical port used for all HTTP based web servers. The MAMP localhost address for your Windows system would be: http://localhost/

On macOS the Apache Port is set to 8888 by default to avoid conflicts with the macOS built-in web sharing modes. In your web browser a custom port is defined in the URL by typing a colon and then the port number like ":8888" after the website server address.

The MAMP localhost address for your macOS system would be: <http://localhost:8888/>

Step 5. Click on the Web Server tab in the MAMP preferences window.

This tab allows you to change the "Document Root" folder that is shared by the Apache server module. By default this "Document Root" directory path is set to the "htdocs" directory in the MAMP program folder.

![[image370.png]]

Unless you have a very specific technical reason to adjust the "Document Root" setting in MAMP it is a good idea to leave this text field at the default value in the MAMP preferences dialog.

### Setting up Apache httpd on Linux

Setting up Apache httpd on Linux

If you are going to be using KartaVR automation scripts on Linux you will also need to install the clipboard tool xclip, along with the Apache (httpd) server modules for web sharing:

yum install xclip httpd

You can start Apache (httpd) using:

systemctl start httpd.service

systemctl enable httpd.service

On CentOS if you want to make the Apache HTTP port 80 accessible external to the machine you can open that port up on the firewall rules:

firewall-cmd --permanent --zone=public --add-service=http

firewall-cmd --reload

On Linux the Apache Port is set to 80 by default. This is the typical port used for all HTTP based web servers. If you need to use an alternative port address you could choose 8080.

The HTTPD (HTTP Daemon) web server's localhost address for your Linux system would be:

http://localhost/

The Apache "Document Root" path is the /var/www/html/ directory. This is where the KartaVR scripts will save the VR webpage preview exports.

Note: You will have to make the "/var/www/html/" folder writable for the users that are running the KartaVR VR preview script. You can either use chmod to change the folder permissions to do this, or you can use chown to add the user to a group with write permissions. The various Apache setup guides on the internet can provide details on this step.

### Installing Windows Subsystem for Linux

Installing Windows Subsystem for Linux

-   [Microsoft \| What is WSL](https://learn.microsoft.com/en-us/windows/wsl/about)
-   [Microsoft \| WSL Docs](https://learn.microsoft.com/en-us/windows/wsl/)

### WinMTR Network Traceroute Utility

WinMTR Network Traceroute Utility

<https://sourceforge.net/projects/winmtr/>

### GitKraken Git GUI Client

GitKraken Git GUI Client

This is an open-source cross-platform compatible git client GUI.

<https://www.gitkraken.com>

### Tower Git GUI Client for macOS/Windows

Tower Git GUI Client for macOS/Windows

<https://www.git-tower.com/mac>

### Installing Dialog

Installing Dialog

Dialog is a Unix terminal based GUI system that functions over SSH connections and in terminal windows.

### Installing CyberDuck for Windows

Installing CyberDuck for Windows

<https://cyberduck.io/>

### Installing Panic Transmit for macOS

Installing Panic Transmit for macOS

<https://panic.com/transmit/>

### Installing Putty for Windows

Installing Putty for Windows

<https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html>

### Installing SSHPass

Installing SSHPass

SSHPass is a command-line utility that dramatically simplifies the process of allowing a shell script to make remote SSH based calls to render nodes.

<https://www.redhat.com/sysadmin/ssh-automation-sshpass>

This toolset is something that should only be used inside of a trusted closed LAN network environment, where you are comfortable and have full awareness of the SSH security implications and network access policies. Do not use this tool if you are in a low-trust environment.

Install SSHPass on macOS:

curl -O -L http://downloads.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz && tar xvzf sshpass-1.05.tar.gz

cd sshpass-1.05

./configure

make

sudo make install

Install SSHPass on LINUX:

yum --enablerepo=epel -y install sshpass

#### SSHPass Install Location

SSHPass Install Location

By default SSHPass is installed to one of the following installation locations.

macOS SSHPass Install Path:

/usr/local/bin/sshpass

CentOS Linux SSHPass Install Path:

/usr/local/bin/sshpass

Ubuntu Linux SSHPass Install Path:

usr/bin/sshpass

#### Using SSHPass

Using SSHPass

Here is an SSHPass shell scripting example that uses ffmpeg to carry out a macOS video capture device based framegrab over an SSH network connection.

This code snippet assumes an environment variable named "SSHPASS_DIR" exists that defines the sshpass installation location. It also uses the macOS based AVFoundation library to grab an image from a webcam named "Cisco VTCamera3".

echo "\[Linux\] Network Framegrab"

\# Note on macOS the ssh -n -t -t flag helps with redirecting the output for tty password submission

"\$SSHPASS_DIR" -p 'correcthorsebatterystaple' ssh -n -t -t vfx@10.20.30.1 'opt/ffmpeg/bin/ffmpeg -y -f avfoundation -framerate 5.000000 -video_size 1600x1200 -pixel_format uyvy422 -vsync 2 -i "Cisco VTCamera3" -f image2 -vcodec mjpeg -vframes 1 -qscale:v 2 /Volumes/Media/screenshot.jpg'

### Installing Zenity / Dialog

Installing Zenity / Dialog

Zenity or Dialog are excellent choices for GUI toolkits if you need to create a quick and efficient user interface for a shell script that is run purely from a text-based terminal session or a remote SSH based session.

<https://gitlab.gnome.org/GNOME/zenity>

If you have used the "dialog" GUI toolkit in the past to create text-based interfaces, you will find Zenity is very natural to pick up and use as well.

macOS Homebrew install:

brew install zenity

brew install dialog

Linux YUM Install:

yum install -y zenity

yum install -y dialog

#### Dialog Usage in a Terminal Window session:

Dialog Usage in a Terminal Window session:

\# Display timer dialog window for 180 seconds

dialog --pause "Wake on LAN Timer" 10 30 180

![[image144.png]]

#### A Dialog text-based GUI example that runs the PING command-line utility:

**A Dialog text-based GUI example that runs the PING command-line utility:**

![[image302.png]]![[image278.png]]![[image354.png]]

Save this script to a "Ping-Dialog.command" file:

#!/usr/bin/env bash

\# Run ping in a dialog v1 2018-07-01 10.52 AM

\# Andrew Hazelden \<andrew@andrewhazelden.com\>

\# The default address to ping

PING_ADDRESS_DEFAULT_FILE="\$TMPDIR/ping_address_default.txt"

PING_ADDRESS_FILE="\$TMPDIR/ping_address.txt"

echo "www.cbc.ca" \> \$PING_ADDRESS_DEFAULT_FILE

\# open "\$TMPDIR/"

\# bbedit \$PING_ADDRESS_FILE

\# Where the output from the ping program is saved

PING_RESULT_FILE="\$TMPDIR/ping_result.txt"

\# Show the ping dialog window

dialog --backtitle "BucketTime Ping Test" \\

--title "Ping" \\

--msgbox "Enter the IP/Domain name you would like to ping." 8 40 \\

--editbox "$PING\_ADDRESS\_DEFAULT\_FILE" 8 40 2\> "$PING_ADDRESS_FILE"

\# Save out the IP/Domain name to a textfile

PING_ADDRESS_URL_STRING=\`cat "\$PING_ADDRESS_FILE"\`

\# echo \$PING_ADDRESS_URL_STRING

\# Run the ping terminal program

ping -c 3 -i 0.5 $PING\_ADDRESS\_URL\_STRING \> "$PING_RESULT_FILE"

PING_RESULT=\`cat "\$PING_RESULT_FILE"\`

#echo \$PING_RESULT

\# Show the result in a new dialog window

dialog --backtitle "BucketTime Ping Test" \\

--title "Ping" \\

--msgbox "\$PING_RESULT" 12 65

\# Done

clear

### WOL (Wake On Lan) Utilities

WOL (Wake on LAN) Utilities

WOL (Wake on LAN) is a network management feature that is often built into 10/100/1000 Ethernet cards. It allows you to wake up computers on your local subnet that are in a low-power sleeping or "OFF" state.

The WOL protocol works by sending a "magic packet" value to a specific computer's ethernet-based IP address/MAC address. The computer then exits from a dormant low-power state and either wakes up from sleep, or does a cold-boot.

If you are working with high-speed networking gear, often a 10Gb+ Ethernet-based network device will have a separate management port for WOL usage that runs at a slower 10/1000 Ethernet speed.

The "wolcmd" executable is a handy free command-line tool that allows a command prompt or terminal session to perform WOL operations:

[Wolcmd for Windows](https://www.depicus.com/wake-on-lan/wake-on-lan-cmd)

[Wolcmd for macOS](https://www.depicus.com/wake-on-lan/wake-on-lan-for-apple-mac)

ZSH/Bash Syntax:

\# An example of using WOL (Wake on LAN)

echo "\[WOL\] Waking up R01"

wolcmd 002590595b16 10.20.30.1 255.255.255.0 4343

### WinRAR Compression

WinRAR Compression

<https://www.rarlab.com/download.htm>

### WinSCP File Transfer

WinSCP File Transfer

<https://winscp.net/eng/index.php>

### Rsync Network File Syncing and Transfer

Rsync Network File Syncing and Transfer

<https://rsync.samba.org>

### Finding Your IP Address

Finding Your IP Address

If you don't know the current IP address for your computer you can check in your operating system's "Network" control panel for more details.

#### Mac Network Preferences

Mac Network Preferences

![[image132.png]]

On macOS you need to click on the System Preferences icon in your Dock. Then open the Network control panel. On the left side of the Network control panel is a listing of each of the network adapters on your computer with entries for things like WiFi, and Ethernet devices.

Select the network adapter you are currently using to access the internet. This network connection will have a green circle icon next to it. With the network adapter selected, the main part of the control panel displays your local IP address next to the words "IP Address:".

You will also see information about this network adapter at the top of the network view next to the words Status: Connected \[Device\] is currently active and has the IP Address of \[address\].

#### Windows 10 Network Control Panel

Windows 10 Network Control Panel

![[image209.png]]

On Windows you need to open the Control Panel \> Network and Internet \> Network Connections window. Right click on your active network connection. Then select the "Status" item in the popup menu.

A status window will open. Click on the Details... button to find out more information about this network device. Then a "Network Connection Details" window will appear. Your current local IP address is listed next to the IPv4 Address line.

#### Linux Network Settings

Linux Network Settings

The easiest way to find out your IP address visually on Linux is to load the Network settings window.

Open the triangle shaped menu at the top right of the screen and select the Settings icon. This will load the "All Settings" window that is used to configure the Linux system.

![[image77.png]]

Look in the "All Settings" window for the Hardware section. Then click on the Network icon on the far right side of the window.

![[image396.png]]

On the left side of the Network settings window is a listing of each of the network adapters on your computer with entries for things like WiFi, Bluetooth, and Wired Ethernet devices.

Select the network adapter you are currently using to access the internet.

This network connection will probably be called "Wired" on a Linux workstation. With the network adapter selected, the main part of the Network window displays your local IP address next to the words "IPv4 Address".

If you have multiple network adapters on your Linux system the active interface will have the word "Connected" displayed next to in the main part of the Network window to the left of the ON/OFF button.

![[image207.png]]

#### Finding your External IP Address Using your Web Browser

Finding your External IP Address Using your Web Browser

A quick and easy way to find out your external ip address is to visit a website like [ipecho.net](https://ipecho.net) or [whatsmyip.org](https://www.whatsmyip.org).

This external IP address is only reachable if your computer is directly connected to the internet and your IP address is not hidden by NAT (Network Address Translation) from your computer existing behind a router or hardware firewall.

If you are behind a router that has NAT enabled then you may have to set up a port forward to route port 80 from your cable modem/router and map it to your computer's manually configured local IP address. This is something that your system administrator or ISP (internet service provider) can assist you with.

#### Finding your External IP Address on Mac and Linux

Finding your External IP Address on Mac and Linux

Your current external internet facing IP address can be also found out on Mac and Linux systems using this terminal command:

curl ipecho.net/plain; echo

#### ifconfig on Mac and Linux

ifconfig on Mac and Linux

On Mac and Linux systems your local IP address can be found using the ifconfig program from the terminal:

ifconfig

You have to scroll through the output to look for an "en" network entry like:

net 192.168.0.100 netmask 0xffffff00 broadcast 192.168.0.255

#### hostname on Linux

hostname on Linux

On CentOS 7 and RedHat 7 Linux systems your local IP address can often be found using the hostname program from the terminal:

hostname -i

#### ipconfig on Windows

ipconfig on Windows

On Windows your local IP address can be found using the ipconfig program from the command prompt:

ipconfig

You have to scroll through the output to look for a network entry like:

IPv4 Address. . . . . . . . . . . : 192.168.0.100

#### get-wmiobject on Windows

get-wmiobject on Windows

On Windows you could also use the get-wmiobject program from the command prompt to look up the local IP address:

powershell -Command "& {get-wmiobject -class Win32_NetworkAdapterConfiguration -Filter IPEnabled=true \| select ipaddress}"

This command will return the IP Address and network MAC address details in a long string of text like:

{192.168.0.100, fe80::e5cd:fce8:700d:1b4e, fdb2:2c26:f4e4:0:54d2:4949:9f22:c62b, fdb2:2c26:f4e4:0:e5cd:fce8:700d:1b4e}

The first 192.168.0.100 entry in this block of text is your computer's local network IP address.