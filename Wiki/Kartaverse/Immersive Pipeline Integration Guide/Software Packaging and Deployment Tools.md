---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

### Pkgs.org

Pkgs.org

This is an essential website to help search and decode the compatibility matrix of 3rd party packages for Linux distros.

<https://pkgs.org/>

### Alien Package Converter for Linux

Alien Package Converter for Linux

The alien command-line utility for Linux makes it possible to extract RedHat style RPM packages and rebuild them so they can be used as .deb Debian Packages on Ubuntu-like Linux distros.

### Rez Package Manager

Rez Package Manager

The Rez package manager is a unique virtual environment toolset designed to meet the precise needs of feature-film level visual effects and animation workflows.

<https://github.com/AcademySoftwareFoundation/rez>

### Pacifist on macOS

Pacifist on macOS

Pacifist is a .pkg file editor and asset extractor for macOS systems. If a .pkg file fails to extract correctly you can use the Pacifist tool to extract all of the assets from the installer bundle to allow for manual software installation procedures to be used.

<https://macappstore.org/pacifist/>

### Nullsoft NSIS Scriptable Install System for Windows

Nullsoft NSIS Scriptable Install System for Windows

<https://nsis.sourceforge.io/>

<https://nsis.sourceforge.io/Main_Page>

### VMWare Install Builder Cross-Platform

VMWare Install Builder Cross-Platform

This toolset was formerly known as BitRock Install Builder.

<https://store-us.vmware.com/vmware-installbuilder-enterprise-5372464400.html>

### QT Creator

QT Creator

QT framework based programs are often distributed using the QT installer toolkit.

<https://www.qt.io/product/development-tools>

### Snap Packages

Snap Packages

Linux distros that support snap packages are able to streamline the process of running complex software that has the executable programs and all of the required library dependencies bundled into a single file.

<https://snapcraft.io/>

### FlatPack Packages

FlatPack Packages

Linux distros that support FlatPack packages are able to streamline the process of running complex software that has the executable programs and all of the required library dependencies bundled into a single file.

<https://www.flatpak.org/>

### Windows MSI Installer Utility

Windows MSI Installer Utility

Windows installers are often provided in a .msi file format.

The MSI installer utility provides the following command-line options that can be used to automate an install process:

    Windows ® Installer. V 5.0.14393.0 

    msiexec /Option  [Optional Parameter]

    Install Options
        </package | /i> 
            Installs or configures a product
        /a 
            Administrative install - Installs a product on the network
        /j<u|m>  [/t ] [/g ]
            Advertises a product - m to all users, u to current user
        </uninstall | /x> 
            Uninstalls the product
    Display Options
        /quiet
            Quiet mode, no user interaction
        /passive
            Unattended mode - progress bar only
        /q[n|b|r|f]
            Sets user interface level
            n - No UI
            b - Basic UI
            r - Reduced UI
            f - Full UI (default)
        /help
            Help information
    Restart Options
        /norestart
            Do not restart after the installation is complete
        /promptrestart
            Prompts the user for restart if necessary
        /forcerestart
            Always restart the computer after installation
    Logging Options
        /l[i|w|e|a|r|u|c|m|o|p|v|x|+|!|*] 
            i - Status messages
            w - Nonfatal warnings
            e - All error messages
            a - Start up of actions
            r - Action-specific records
            u - User requests
            c - Initial UI parameters
            m - Out-of-memory or fatal exit information
            o - Out-of-disk-space messages
            p - Terminal properties
            v - Verbose output
            x - Extra debugging information
            + - Append to existing log file
            ! - Flush each line to the log
            * - Log all information, except for v and x options
        /log 
            Equivalent of /l* 
    Update Options
        /update [;Update2.msp]
            Applies update(s)
        /uninstall [;Update2.msp] /package 
            Remove update(s) for a product
    Repair Options
        /f[p|e|c|m|s|o|d|a|u|v] 
            Repairs a product
            p - only if file is missing
            o - if file is missing or an older version is installed (default)
            e - if file is missing or an equal or older version is installed
            d - if file is missing or a different version is installed
            c - if file is missing or checksum does not match the calculated value
            a - forces all files to be reinstalled
            u - all required user-specific registry entries (default)
            m - all required computer-specific registry entries (default)
            s - all existing shortcuts (default)
            v - runs from source and recaches local package
    Setting Public Properties
        [PROPERTY=PropertyValue]

    Consult the Windows ® Installer SDK for additional documentation on the
    command line syntax.

    Copyright © Microsoft Corporation. All rights reserved.
    Portions of this software are based in part on the work of the Independent JPEG Group.

### macOS PKG Installer Utility

macOS PKG Installer Utility

On macOS the .pkg installer utility provides the following command-line options that can be used to automate an install process:

    **installer**
    Usage: installer [-help] [-dominfo] [-volinfo] [-pkginfo] [-allowUntrusted] [-dumplog]
                     [-verbose | -verboseR] [-vers] [-config] [-plist]
                     [-file ] [-lang ] [-listiso]
                     [-showChoicesXML] [-applyChoiceChangesXML ]
                     [-showChoicesAfterApplyingChangesXML ]
                     -pkg 
                     -target <[DomainKey|MountPoint]>
    The installer utility can list provide more verbose help options by adding the -help flag when you run it from the terminal:


    **installer -help**
    Usage: installer [options...] -pkg  -target 

    Options:
        [-dominfo]                 # Display domains that can be installed into.
        [-volinfo]                 # Display volumes that can be installed onto.
        [-pkginfo]                 # Display package that will be installed
                                       (for metapackages, shows contents).
        [-query]             # Display information about package metadata.
        [-allowUntrusted]          # Allow installing a package signed by an
                                       untrusted (or expired) certificate.
        [-dumplog]                 # Write log information to standard error
                                       (in addition to the usual syslog).
        [-help]                    # Display this help information.
        [-verbose]                 # Display detailed information.
        [-verboseR]                # Display detailed information with
                                       simplified progress output.
        [-vers]                    # Display this tool version.
        [-config]                  # Display command line parameters in XML
                                       plist format.
        [-plist]                   # Display -dominfo, -volinfo, or -pkginfo in
                                       XML plist format (ignored when performing
                                       installation).
        [-file ]       # Configuration file supplying parameters in
                                       XML plist format.
        [-lang ]  # Sets the default language Mac OS X will use
                                       after installation.
        [-listiso]                 # Lists the ISO language codes that are
                                       recognized.
        [-showChoicesXML]          # Output XML data describing the choices and
                                       their properties and state.
        [-showChoicesAfterApplyingChangesXML ]
                                   # Apply changes specified in the file to the
                                       choices in the package and output the
                                       resulting XML data.  See below for the
                                       file format description.
        [-applyChoiceChangesXML ]
                                   # Apply changes specified in the file to the
                                       package and proceeds with installation.
                                       See below for the file format
                                       description.

    Device:
        The -target  parameter is any one of the following:

        (1) One of the domains returned by -dominfo.
        (2) Volume mount point.  Any entry of the form of /Volumes/Mountpoint.
              ex: /Volumes/Untitled

    Flags:
        RestartAction       # Can optionally return one of the following:
                        None
                        RecommendRestart
                        RequireLogout
                        RequireRestart
                        RequireShutdown

    Choices file-format:
        An XML file that is an array of choiceIdentifiers (as strings) to
        toggle. Each choiceIdentifier specified will be toggled in order --
        exactly as if a user had clicked on its checkbox in Installer.app's
        customization pane.

    Examples:
        installer -pkg InstallMe.pkg -target CurrentUserHomeDirectory
        installer -pkg InstallMe.pkg -target '/Volumes/Macintosh HD2' -lang ja
        installer -volinfo -pkg InstallMe.pkg
        installer -pkginfo -pkg InstallMe.pkg
        installer -query RestartAction -pkg InstallMe.pkg
        installer -pkg InstallMe.pkg -target / -showChoicesXML