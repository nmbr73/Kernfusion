---
tags: [export, export-scrivener, revise]
prev: Installing a Local Content Staging Web Server
next: Using BBEdit on macOS
---

There is a highly-customized Resolve/Fusion IDE usage centric version of Notepad++ available from Reactor. It is a 32-bit build of Notepad++ that has the TextFX module installed.

Please hold off doing an automatic-update the moment Notepad++ launches as there are not likely too many features missing from this release that you require. If you accidentally hit the auto-update button you will likely download, and roll-back to a 100% stock build of Notepad++ if you immediately hit the update button. Resist the urge....

<https://notepad-plus-plus.org/>

Notepad++ for Fusion Customization Documentation:

-   [Notepad++ for Fusion Atom package](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=39833#p39833)
-   [NPP Atom Package Docs](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.wesuckless.NotepadPlusPlus/Windows/Docs/com.wesuckless.NotepadPlusPlus.md)
-   [Web \| Add "Open with Notepad++" to the Right-Click Menu](https://www.winhelponline.com/blog/open-with-notepad-plus-right-click-menu-windows/)
-   [Pixar USD Syntax Highlighter](https://github.com/AndrewHazelden/PIXAR-USD-Syntax-Highlighter)

Notepad++ Related Docs:

-   [Web \| Microsoft \| Creating Shell Extension Handlers](https://learn.microsoft.com/en-us/windows/win32/shell/handlers?source=recommendations)
-   [Web \| Microsoft \| Working with Shell Extensions](https://learn.microsoft.com/en-us/windows/win32/shell/shell-exts)

### The Dark Mode Customized UI

The Dark Mode Customized UI

![[image79.png]]

#### The Language Menu

The Language Menu

![[image87.png]]

#### The Run Menu

The Run Menu

![[image368.png]]

#### Right-Click Contextual Menu Items:

Right-Click Contextual Menu Items:

##### Edit Sub-Menu

Edit Sub-Menu

![[image46.png]]

##### Search Sub-Menu

Search Sub-Menu

![[image213.png]]

##### Tools Sub-Menu

Tools Sub-Menu

![[image342.png]]

### View Code Snippets

View Code Snippets

This user interface has pre-made code snippets of UI Manager Lua, UI Manager Python, and BBCode content.

![[image165.png]]

### Notepad++ Shell Extensions for Windows

Notepad++ Shell Extensions for Windows

Shell; Extensions are a core-Windows feature that allows you to add an entry to the Windows Registry that will insert a new custom Explorer Right-Click contextual menu entry.

A stock "Add Open in Notepad++ Shell Ext Entry.reg" shell extension text-file looks like this before the executable file-path has been revised to a custom installation location:

Windows Registry Editor Version 5.00

\[HKEY_CLASSES_ROOT\\\*\\shell\\Open with Notepad++\]

"Icon"="C:\\\\Program Files (x86)\\\\Notepad++\\\\notepad++.exe"

\[HKEY_CLASSES_ROOT\\\*\\shell\\Open with Notepad++\\command\]

@="\\"C:\\\\Program Files (x86)\\\\Notepad++\\\\notepad++.exe\\" \\"%1\\""

You can remove this shell extension using the following Windows Registry file named "Remove Notepad++ Shell Ext Entry.reg":

Windows Registry Editor Version 5.00

\[-HKEY_CLASSES_ROOT\\\*\\shell\\Open with Notepad++\]