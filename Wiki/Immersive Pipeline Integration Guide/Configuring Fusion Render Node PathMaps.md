1\. Open the Fusion Render Node program and select the "Preferences..." menu item.

![[image49.png]]

2\. Click on the "Global Settings \> Path Map" category on the left side of the Preferences window.

![[image269.png]]

3\. At the bottom of the window click on the "New" button to add a new entry to the "User" section of the "Path Map" view.

4\. Enter the following settings **From: LuaModules:** and **To: UserPaths:Modules/Lua**. Click the "Save" button to retain these settings.

5\. If you don't have Reactor Path Map entries added to Fusion Render Node already, then you might have to further customize the preferences to add values like:

Windows:

**From: Reactor:** and **To: C:\\ProgramData\\Blackmagic Design\\Fusion\\Reactor\\**

macOS:

**From: Reactor:** and **To: /Library/Application Support/Blackmagic Design/Fusion/Reactor/**

Linux:

**From: Reactor:** and **To: /var/BlackmagicDesign/Fusion/Reactor/**

Also you would need to edit the pre-existing UserPaths PathMap entry:

**From: UserPaths:** and **To: UserData:;AllData:;Fusion:;Reactor:Deploy**

6\. Restart Fusion Render Manager to lock in these values.

Note: If the LuaModules PathMap entries were not added to Fusion Render Node's preferences, a typical error message in Fusion Render Node would look a bit like this:

14/Apr/22 16:12:50: .../Fusion/Fuses/Vonk Ultra/Text/Create/vTextFromArray.fuse:5: module 'vjsonutils' not found:

no field package.preload\['vjsonutils'\]

no file 'LuaModules:vjsonutils.lua'

no file 'LuaModules:vjsonutils/init.lua'

no file 'LuaModules:vjsonutils.so'