### Keyboard Maestro on macOS

Keyboard Maestro on macOS

Keyboard Maestro is a GUI automation tool that allows you to script and control macOS based programs through the use of scripting direct user interface based interactions like mouse cursor moves, mouse clicks, keyboard key presses, menu selections, button pressing, text field typing, and Apple Script code execution.

From a practical perspective, for any process that a human user can do on a macOS system, Keyboard Maestro can be used to automate the same task in a visual fashion.

<https://www.keyboardmaestro.com/main/>

For more information:

-   [Keyboard Maestro Wiki](https://wiki.keyboardmaestro.com/User_Manual)
-   [Keyboard Maestro Forum](https://forum.keyboardmaestro.com)
-   [KartaLink kvrKeyboardMaestro Fuse](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.KartaLink.KeyboardMaestro/Docs/Kartaverse/KartaLink/com.AndrewHazelden.KartaLink.KeyboardMaestro.md)

Keyboard Maestro offers a free trial version on their website you can use to evaluate the toolset.

![[image59.jpg]]

### KartaLink \| Keyboard Maestro Node

KartaLink \| Keyboard Maestro Node

KartaLink is an effort to provide node-based pipeline automation features to help XR artists tame complex multi-application based post-production workflows.

The new Keyboard Maestro fuses make it possible to run macOS based Keyboard Maestro macros from inside Fusion's node graph. This unlocks node-based GUI automation techniques such as controlling external applications via simulating keyboard and mouse actions.

This fuse requires the installation of "Keyboard Maestro" for macOS:

[https://www.keyboardmaestro.com/main/](https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.keyboardmaestro.com%2Fmain%2F%3Ffbclid%3DIwAR058T1P5zQgtf-IPt8H6wYS_uJYArpw7jBhNEMcBHrapXjncPzwmoNePtw&h=AT1z4qgY_0P7KEbhMe4kZ1oDtPX80tdFUKpAkaeoZwci8lUbGK6qYWZ1G6qFt98PYXwaWjr2zNpJrQ2ILFIiDGKG_CI7KL7Nx0S_NVpKSjh0FCoH6E16KWRNkNXcHn6iRQ0C4j8&__tn__=-UK-R&c%5B0%5D=AT1-kEEfRR8kNTHkGkNZA-_fRNLrx_SEXkpqq1T-0ItAmQyiodNa2gIRDD9JSGZZ4q7KUIXpLnKd22aBmr8TS_MxHF6xBdYXn4K9fCATPdLsjaGMBMnHl8xmwihfm5-Q76-pvYpIGOfw7hatxY1GKO2bHsMRz8aP-RMcN7e7Mghh7n0LU0fLr1F6rrVClxiydn6VIa-9vZJ_dYsSG3Z_hO4)

The Reactor Package Manager is used to install the KartaLink collection of tools.

![[image70.jpg]]

There are two versions of the Keyboard Maestro macros: A version that can be connected to image based input/output connections, and a version that works with text based input/output connections such as the Vonk Ultra "vText" nodes.

![[image134.jpg]]

The"kvrKeyboardMaestro" fuses have an "Open Keyboard Maestro" button that is found in the Inspector window. This feature makes revising the automation macros a single-click task.

![[image234.jpg]]

The Keyboard Maestro Editor is very flexible in how you build your automation macros. You can either run a recorder to track your visual on-screen actions, or you can incrementally build the actions one at a time by hand for more precision and control.

![[image26.jpg]]

![[image47.jpg]]

#### Usage:

Usage:

1\. Create a new comp.

2\. Add a "kvrKeyboardMaestro" image or text based fuse to the comp.

3\. In the Inspector window, enter the name of the Keyboard Maestro macro you want launched into the text field labelled "Macro Name".

4\. The first time the macro is run, you need to approve a macOS security message that says:

"Fusion.app" wants access to control "Keyboard Maestro.app". Allowing control will provide access to documents and data in "Keyboard Maestro.app" and to perform actions within that app.

You need to click the "OK" button to continue.

5\. In Keyboard Maestro's Editor program create a corresponding macro that will perform the actual GUI automation tasks. Click the "New Action" button in the Editor window to add each step you'd like the macro to carry out. You could also use the "Record" button to save a series of mouse interactions or keyboard button presses.

6\. When your macro is complete, switch out of the "Edit" state and then try out the macro.

#### Tips:

Tips:

If you only want Keyboard Maestro launched when a Fusion batch render is occurring, uncheck the "Interactive Render" checkbox.

### Using AppleScript OSAX Scripting from the Terminal

Using AppleScript OSAX Scripting from the Terminal

AppleScript is the native macOS scripting architecture that allows for inter-application control via the Apple Scripting Dictionary and Apple Events. AppleScripts are typically created in the macOS Script Editor program. You can also run inline AppleScript code as a block of text from a command-prompt session using the OSAX scripting utility.

For more information:

-   [Apple Mac Automation Scripting Guide](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/HowMacScriptingWorks.html)
-   [KartaLink kvrAppleScript Fuse Docs](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.KartaLink.AppleScript/Docs/Kartaverse/KartaLink/com.AndrewHazelden.KartaLink.AppleScript.md)

### KartaLink \| Apple Script Node

KartaLink \| Apple Script Node

Kartaverse's KartaLink tool collection includes a package named "KartaLink \| Apple Script". This is available in the Reactor Package Manager for Resolve/Fusion.

![[image39.jpg]]

Run macOS based Apple Script code snippets from inside a Fusion Studio node-graph. This unlocks node-based automation techniques such as controlling external applications via Apple Events and OSAX (Open Scripting Architecture Extension) scripting.

In only a few moments you can start exploring Apple Script automation techniques inside of Resolve/Fusion. The simplest command to begin with if this is 100% new territory for you is "beep" which plays a chime sound as each frame is rendered. The double dashes on the first line of code is used to add a comment entry that is ignored when the code is run.

![[image338.jpg]]

Apple Script allows you to automate tasks that can include sending SMS messages via the Apple Messages app.

![[image198.jpg]]

It's now possible to have progress messages or other info passed from Resolve/Fusion to your cell phone via SMS when you need to find out what's happening on a rendering task.

![[image219.jpg]]

The Apple Script Editor dictionary allows you to learn more about the 3rd party scripting capabilities you can tap into on your mac.

![[image131.jpg]]

### Apple Script Editor

Apple Script Editor

If you want to learn more about Apple scriptable programs, open the Apple Script Editor and then select the "File \> Open Dictionary..." menu item.

![[image74.png]]

The "Open Dictionary" window allows you to select Apple Scriptable programs and learn more about their capability.

![[image124.png]]

This is the Apple Script Dictionary output from the Panic Transmit file transfer program.

![[image401.jpg]]

You could also use the "Record" button to save a series of interactions into the Apple Script Editor window.

After you record a task in the Script Editor window, you can then copy/paste this code back into the "kvrAppleScript" fuse's interface in the Resolve/Fusion Inspector view.

![[image146.png]]

### Auto-IT on Windows

Auto-IT on Windows

AutoIT is a GUI automation program for Windows. It is the Windows equivalent to Keyboard Maestro.

<https://www.autoitscript.com/site/autoit/>

### Microsoft Power Automate for Windows

Microsoft Power Automate for Windows

<https://powerautomate.microsoft.com/en-us/>

<https://learn.microsoft.com/en-us/power-automate/>

### PyAutoGui

PyAutoGui

<https://pypi.org/project/PyAutoGUI/>

### Homebrew Package Manager for macOS

Homebrew Package Manager for macOS

If you need to regularly compile and run common open-source software on your macOS system, the odds are good that a brew package already exists for the tool.

<https://brew.sh>

Homebrew can be installed on a fresh macOS system by running the following shell script in the terminal:

/bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### LuaJIT

LuaJIT

LuaJIT is a cross-platform scripting environment that runs Lua scripts from a terminal session. As far as interpreted scripting languages go, Lua is fast, efficient, and simple to use.

<https://luajit.org/luajit.html>

For more information:

-   [LuaJIT FFI Library](https://luajit.org/ext_ffi.html)
-   [LuaJIT FFI Tutorial](https://luajit.org/ext_ffi_tutorial.html)
-   [LuaJIT FFI API Functions](https://luajit.org/ext_ffi_api.html)

### LuaJIT in Resolve/Fusion

LuaJIT in Resolve/Fusion

Blackmagic Design's Resolve Studio, and Fusion Studio software, both include a scripting API known as "FuScript". This scripting system has a built-in copy of the LuaJIT interpreter which allows users to run .lua script files. You can also use your own install of Python with the FuScript API.

LuaJIT has advanced features like "[FFI library](https://luajit.org/ext_ffi.html)" access which allows .lua scripts and fuses to access ANSI C API functions provided by external shared libraries like .dll (Windows), .dylib (macOS), and .so (Linux and macOS).

### Lua Rocks Package Manager

Lua Rocks Package Manager

Lua Rocks provides a web-based cross-platform compatible package manager that runs from a Terminal session. This approach is the most common way to be able to find and use compiled Lua modules.

<https://luarocks.org/>

Lua Rock compiled Lua Modules can be used with the LuaJIT FFI interface from Resolve Studio and Fusion Studio.

You may have to customize your macOS Terminal shell session's "LUA_PATH" and "LUA_CPATH" environment variables if you want Fusion to be able to use the Lua Rocks compiled libraries.

Doing this step means you don't have to copy your Lua Rocks compiled .dll/.so files and .lua files into the Fusion managed LuaModules: PathMap folder.

### Lua Love Real-Time 2D Engine

Lua Love Real-Time 2D Engine

Lua Love is an lean and efficient open-source real-time 2D engine that uses Lua scripts to create 2D games and immediate mode GUI based graphical tools and utilities.

<https://love2d.org/>

For more information:

-   [Love Wiki](https://love2d.org/wiki/Main_Page)
-   [LÖVE-Nuklear Immediate Mode GUI](https://github.com/keharriso/love-nuklear)