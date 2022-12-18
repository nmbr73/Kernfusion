Common Environment variables in a fully configured Fusion Studio deployment typically include:

-   PATH
-   LD_LIBRARY_PATH
-   FUSION16_PROFILE
-   FUSION16_PROFILE_DIR
-   FUSION16_MasterPrefs
-   FUSION_LICENSE_SERVER
-   FUSION_PLUGIN_PATH
-   FUSION_OFX_PLUGIN_PATH
-   OCIO
-   LUA_PATH
-   LUA_CPATH
-   REACTOR_DEBUG

Essential reading on this topic includes:

-   [VFXPedia \| Fusion Environment Variables](https://www.steakunderwater.com/VFXPedia/96.0.243.189/indexdca0.html?title=Environment_Variables)
-   [VFXPedia \| Per-User Preferences and Paths](https://www.steakunderwater.com/VFXPedia/96.0.243.189/indexad6a.html?title=Per-User_Preferences_and_Paths)
-   [VFXPedia \| Administrators FAQ](https://www.steakunderwater.com/VFXPedia/96.0.243.189/indexa105.html?title=Administrators_FAQ)

### Blocking Incompatible OFX Plugins From Loading in Fusion

Blocking Incompatible OFX Plugins From Loading in Fusion

After you install a wider range of compositing tools on your visual workstations and render nodes, you will likely need to set up a "Fusion OFX Blocklist File". This will stop a wide range of Fusion startup error messages from being spawned regularly by the broken OFX plugins, that would otherwise spam the Console window and halt Fusion with nagging error dialogs.

The standard OFX Plugin folder location is:

Windows:

C:\\Program Files\\Common Files\\OFX\\Plugins

Mac:

/Library/OFX/Plugins/

Linux:

/usr/OFX/Plugins/

An interesting thing about using an OFX blocklist file approach, is that it allows incompatible OFX plugins to be skipped transparently when Fusion Studio/Fusion Render Nodes are launched. This is achieved by specifically defining the exact name of the OFX plugins you want excluded, one-item-per-line in the file.

This document is created at the PathMap location of:

Profile:\\FusionOFX.blocklist

The "UI Manager" atom package includes a handy script called the "OFX Blocklist Generator" that streamlines the effort needed to prepare a Fusion Studio v18 compatible blocklist resource. The script scans inside your OFX Plugins folder path and then lists those items in a new text-based configuration file.

![[image246.png]]

### Fusion Profile Customizations

Fusion Profile Customizations

A customized Fusion Profile Path can be configured to pre-define the Fusion preferences for an artist through the use of environment variables, along with a Fusion Master Prefs.

Make sure to define a Master Prefs locking setting when generating the Lua table based document.

### Fusion Diagnostic Tool

Fusion Diagnostic Tool

The "UI Manager" atom package includes a handy script called the "Fusion Diagnostics Tool" that allows you to troubleshoot your most common Fusion-based environment variables in a low-effort fashion.

![[image294.png]]