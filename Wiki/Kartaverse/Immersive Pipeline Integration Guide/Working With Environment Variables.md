---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

An environment variable can be thought of as a system wide preference that any program that is started is able to read. An environment variable is a technique that system administrators will often use to customize the operating environment that software runs inside of on a workstation or render node.

This concept of customizing environment variables allows you to pass a common set of preferences to multiple executable programs in a consistent way. It helps inform software of the custom values you might want to define system wide and avoids using hard-coded fixed settings in each application.

It is possible to read environment variables inside of just about every general purpose programming language or scripting language like C, C++, C#, Python, Lua, Perl, PHP, Batch, and BASH/ZSH, etc.

### Windows Environment Variables

Windows Environment Variables

The "PATH" variable, which is written as %PATH% when accessed from the command prompt window, is used for several purposes. One of those use cases is to define which executable programs on your computer (.exe, .bat, etc files) can be run from a terminal session simply by typing in the program's base filename without having to always write in the full folder path to the program.

This saves a lot of time when a user frequently navigates a filesystem hierarchy in a text based command prompt/terminal window and runs a series of command line tools.

Editing the Windows OS %PATH% environment variable is done by opening your Windows System Control Panel. Click on the Advanced system settings button on the left side of the window.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image231.png]]

The "System Properties" window will appear. Click on the Environment Variables... button.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image126.png]]

In the "Environment Variable" window you need to scroll down in the "System variables" section of the view and select the Path entry. Click the Edit... button.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image378.png]]

On Windows 10 a visual "Edit environment variable" editor window will appear. This dialog has separate path text fields that make it easier to add/remove and re-order the individual environment `%Path%` variable items.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image355.png]]

#### Listing the Active Windows Environment Variables

Listing the Active Windows Environment Variables

On Windows 10 you can type "`set`" into the Command Prompt window to see all of the active environment variables on the system.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image365.png]]

### Linux Environment Variables

Linux Environment Variables

If you are on a Linux system, system wide environment variables are typically defined by editing either a "`$HOME/.profile`" or "`$HOME/.bash_profile`" document based upon your current shell.

You would then add new environment variable to the profile document that look a bit like this:

    export REACTOR_DEBUG_FILES=true
    export REACTOR_DEBUG=true
    export REACTOR_INSTALL_PATHMAP=AllData:

#### Listing the Active Linux Environment Variables

Listing the Active Linux Environment Variables

On Linux you can type "`env`" into the Terminal window to see all of the active environment variables on the system.

### macOS Environment Variables

macOS Environment Variables

If you are on macOS Monterey, you might have several environment variables active in your macOS ZSH session, that were defined via a "`$HOME/.zshrc`" file. If you add more and more environment variables to your workstation in this fashion, you will later on be quite surprised to find out these values are not used system wide in all of the programs you might run.

In the long term, macOS power users tend to transition away from relying on .zshrc files as the way they define their environment variables over to using macOS Launch Agent .plist files. The .plist file approach is advantageous as it allows executables that are started by double-clicking on the .app package, or run from the dock, to access the same environment variables values that can be accessed in Terminal sessions and in AppleScripts, too.

On a macOS system the easiest and most reliable way to set up new environment variables is with the help of LaunchAgent .plist files. If you want to make it easy to visually edit a LaunchAgent PLIST document as you get started, you can look at using a 3rd party utility like["LaunchControl" by Soma-Zone](http://www.soma-zone.com/LaunchControl/).

Most often Launch Agent .plist files are edited by hand in a programmer's text editor, to customize them, before you would install them on your system.

Here is an example of a Launch Agent PLIST text file that ships with the Reactor package manager. It is named "setenv.reactor.REACTOR_DEBUG.plist" and is used to turn on debug logging via a "`REACTOR_DEBUG`" environment variable that is set to a value of "`true`":

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
         <key>Label</key>
         <string>setenv.reactor.REACTOR_DEBUG</string>
         <key>ProgramArguments</key>
         <array>
             <string>/bin/launchctl</string>
             <string>setenv</string>
             <string>REACTOR_DEBUG</string>
             <string>true</string>
         </array>
         <key>RunAtLoad</key>
         <true/>
        </dict>
    </plist>

These type of Launch Agent .plist documents are designed to be installed on your macOS system using root permissions to the folder:

    /Library/LaunchAgents/

Alternatively, you can install a Launch Agent .plist file in your home folder:

    /Users/vfx/Library/LaunchAgents

When you go to install the .plist files you will need to change the documents to be owned by "root", have the group name of "wheel", and have a Unix "octal" file permission setting of 644.

    sudo chown root /Library/LaunchAgents/setenv.reactor.*.plist
    sudo chgrp wheel /Library/LaunchAgents/setenv.reactor.*.plist
    sudo chmod 644 /Library/LaunchAgents/setenv.reactor.*.plist

You can take a look at the file permissions of the Launch Agent files on your system using the following terminal command:

    ls -la /Library/LaunchAgents/

You will then see a directory listing that looks something like this:

    drwxr-xr-x  24 root  wheel   816 Nov 17 12:28 .
    drwxr-xr-x+ 62 root  wheel  2108 Nov 17 11:59 ..
    -rw-r--r--   1 root  wheel   715 Oct 26  2016 org.macosforge.xquartz.startx.plist
    -rw-r--r--@  1 root  wheel   474 Nov 17 05:42 setenv.reactor.REACTOR_BRANCH.plist
    -rw-r--r--@  1 root  wheel   463 Oct 25 07:25 setenv.reactor.REACTOR_DEBUG.plist
    -rw-r--r--@  1 root  wheel   475 Oct 25 07:27 setenv.reactor.REACTOR_DEBUG_FILES.plist
    -rw-r--r--@  1 root  wheel   473 Dec  7 22:23 setenv.reactor.REACTOR_INSTALL_PATHMAP.plist

#### Listing the Active macOS Environment Variables

Listing the Active macOS Environment Variables

On macOS you can type "`env`" into the Terminal window to see all of the active environment variables on the system.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image398.png]]