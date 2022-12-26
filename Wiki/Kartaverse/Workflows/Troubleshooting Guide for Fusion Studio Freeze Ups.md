---
author: Andrew Hazelden
tags:
  - Kartaverse
  - Workflow
  - .scrivener-export
---

> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

# Troubleshooting Guide for Fusion Studio Freeze Ups

What follows is a handy set of tips that can be used by a comp TD to find the root cause of issues when a Fusion Studio .comp file crashes all the time. It can also help you track down if a GPU glitch is responsible for your Fusion freezes, etc...

### Adding the Custom Hidden Environment Variable

Adding the Custom Hidden Environment Variable

If Fusion is crashing unexpectedly, you can add a custom environment variable to your Windows system called "`FUSION_EXCEPTION_HANDLER=true`".

When this undocumented environment variable is active, if Fusion crashes, it automatically produces a diagnostic report listing the source of the problem.

### Step 1. Environment variables are added to your Windows PC using the "System" Control Panel.

**Step 1.** Environment variables are added to your Windows PC using the "System" Control Panel.

![[image2__fix6.png]]

With the System Control Panel visible, on the top left of the window is the clickable text "Advanced system settings".

In the Advanced System settings window, you can click the "Environment Variables" button on the lower right of the window to show the "Environment Variables" dialog.

At the bottom of the "Environment Variable" window is a "System Variables" section. Clicking the "New..." button will display a "New System Variable" dialog.

(FYI The next image shows the new environment variable in the Systems Variable section. This only exists after you add it, manually, by yourself to the environment variable window...)

![[image4__fix6.png]]

### Step 2. In the "New System Variable" dialog enter the "Variable name:" as "FUSION_EXCEPTION_HANDLER". Then enter the "Variable value:" as "true". Click the "OK" button to save this new environment variable entry.

Step 2. In the "New System Variable" dialog enter the "Variable name:" as "`FUSION_EXCEPTION_HANDLER`". Then enter the "Variable value:" as "`true`". Click the "OK" button to save this new environment variable entry.

![[image5__fix5.png]]

### Step 3. It's now time to restart your Windows system for the newly added environment variable to be active.

Step 3. It's now time to restart your Windows system for the newly added environment variable to be active.

### Step 4. After rebooting your system, you can check if the "FUSION_EXCEPTION_HANDLER" environment variable is present and active by opening the Command Prompt and entering:

Step 4. After rebooting your system, you can check if the "`FUSION_EXCEPTION_HANDLER`" environment variable is present and active by opening the Command Prompt and entering:

    echo %FUSION_EXCEPTION_HANDLER%

The result should be:

    true

![[image7__fix3.png]]

### Step 5 Now when you start up Fusion Studio, if the program crashes a crash dump report is generated on the Windows platform, and is written automatically to the %temp% folder. This path is represented on disk as:

Step 5 Now when you start up Fusion Studio, if the program crashes a crash dump report is generated on the Windows platform, and is written automatically to the `%temp%` folder. This path is represented on disk as:

    C:\Users\<User Account>\AppData\Local\Temp

The following Fusion crash dump report files are written to disk each time:

"`crash.dmp`"

"`crash.log`"

"`crashdump_x64_YYYY-MM-DD_HH-MM-SS.zip`"

The last crash log has the date and time code is expanded as a filename like this:

"`crashdump_x64_2020-07-11_18-45-10.zip`"

![[image1__fix7.png]]

### Step 6. Do ***NOT*** submit these undocumented Fusion API based crash reports to BMD. They would arrive at a currently-unmonitored development email address.

Step 6. Do **\*\*\*NOT\*\*\*** submit these undocumented Fusion API based crash reports to BMD. They would arrive at a currently-unmonitored development email address.

### Generating a Crash State in Fusion

Generating a Crash State in Fusion

When a crash state happens in Fusion, with the undocumented environment variable active, a crash dump log is saved to disk.

These log files are special in that it saves all of the required debugging information, from the current Fusion artists session to disk, along with a full memory dump that allows a programmer to find out the source cause of the Fusion program freeze up.

### Forcing a crash log from Fusion Console:

Forcing a crash log from Fusion Console:

Step 7. You can also use the Fusion Console window and run the following Lua command if the Fusion left or right viewer windows fail to update your 3D or 2D view contexts... but the rest of the Fusion program still functions:

**fu:Crash()**

![[image3__fix8.png]]

Step 8. In the crash dialog **ALWAYS** select the "No" option. Never EVER select the "Yes" option or your crash log will end up in a Fusion developer's email inbox.... 🙄

![[image6__fix10.png]]

### Forcing a crash log from the Command Prompt Window:

Forcing a crash log from the Command Prompt Window:

Step 9. If the Fusion UI is locked and unresponsive it is also possible to use Fusion's CLI (command-line) interface to force a crash state and a log file to be written to disk.

First navigate in the command prompt window into the Fusion Studio folder using this folder:

    cd "C:\Program Files\Blackmagic Design\Fusion 18\"

Step 10. Then look in the Task Manager to find the Fusion Studio Process ID(PID) aka "Process number" code.

Finally, using FuScript, (the Fusion scripting API that runs inside the Command Prompt window), you can dump the active Fusion GUI process state using:

    FuScript.exe -d <process num>