As you start to create more complex macros, you will eventually "hit the wall" of what is possible, if you are simply using expressions to apply math formulas, and read values from user controls and node input attributes. 

If you start an expression code block with a ":" colon symbol, you are able to run inline chunks of LuaJIT code directly. When running Lua script based expressions, you do need to "return" a value at the end of the code block . This gives the input control that hosts the expression gets a final number/string value to work with when the code finishes.

Included below are several examples of what can be done with "simple expressions" that start with a colon symbol ":", and LuaJIT scripting.


## Fusion Comp Object

If you want to access the current Fusion comp object from an expression or intool script based code block you can use:
```lua
self.Comp.
```


## Fusion Node Name 

If you want to access the current Fusion node name from an expression or intool script based code block you can use:
```lua
:return Text(self.Name or "")
```



## Debugging Expression Values

The "trace()" function can be used inside an expressions field to print debugging information directly to the Console window.
```lua
:trace(5); return Text([[Hello World!]])
```


## PathMaps

A Fusion PathMap (relative filepath) can be expanded into an absolute file path in an expression using:
```lua
:return Text(self.Comp:MapPath([[Reactor:/Deploy/]]))
```


## Running Actions

A Fusion "Action" can be run asynchronously in a separate thread from an expression using:
```lua
:self.Comp:Execute([[comp:DoAction("Comp_Save", {})]]);return Text([[DoAction Comp_Save]])
```
The "Comp_Save" action tells Fusion to re-save the existing .comp file to disk.

The following code will display list of the available actions in the Console window:
```lua
-- Track the actions that are available in Fusion
local actionList = fu.ActionManager:GetActions()

-- Count the total number of actions
actionCount = 0
for i, act in ipairs(actionList) do
	if not act:Get('Parent') then
		actionCount = actionCount + 1
	end
end
print('[' .. actionCount .. ' Actions Found]')

-- List each action sequentially
for i, act in ipairs(actionList) do
	if not act:Get('Parent') then
		print(act.ID)
	end
end
```


## Run a shell task via io.popen

The `io.popen()` lua function tells LuaJIT to run an external command line tool from inside the main render thread. The popen tool captures the return value from the shell's standard I/O stdout buffer.


=== "Windows"
	```lua
	:local commandString = [[C:\Windows\System32\where.exe curl.exe]]; local handler = io.popen(commandString); local response = tostring(handler:read('*a')); handler:close(); return Text(response:sub(1,-2) or "")
	```

=== "macOS/Linux"
	```lua
	:local commandString = [[which curl]]; local handler = io.popen(commandString); local response = tostring(handler:read('*a')); handler:close(); return Text(response:sub(1,-2) or "")
	```


## Run a shell task via os.execute

The `os.execute()` lua function tells LuaJIT to run an external command line tool from inside the main render thread. With `os.execute()` you may have to use the "tee" utility, or shell redirection techniques to capture a return value from the shell's standard I/O stdout buffer. 

=== "Windows"
	```lua
	:local url = [[https://www.steakunderwater.com/]];os.execute("explorer \"" .. url .. "\"");return Text("Opening WSL")
	```

=== "macOS"
	```lua
	:local url = [[https://www.steakunderwater.com/]];os.execute("open \"" .. url .. "\" &");return Text("Opening WSL")
	```

=== "Linux"
	```lua
	:local url = [[https://www.steakunderwater.com/]];os.execute("xdg-open \"" .. url .. "\" &");return Text("Opening WSL")
	```


## Run LuaJIT Inline Code via dostring

The dostring function tells LuaJIT to run a block of code, in the main render thread:
```lua
:local str = [[print("Hello World")]];return Text(dostring(str or ""))
```



## Run Python Inline Code Asynchronous via Execute

Fusion is able to run a block of Python code asynchronously in a separate thread using the expression:
```lua
:local py_script = [[!Py: import sys;print(sys.version)]]; self.Comp:Execute(py_script); return Text("Running Python!")
```


## Run LuaJIT Inline Code Asynchronous via Execute

Fusion is able to run a block of LuaJIT code asynchronously in a separate thread using the expression:
```lua
:local lua_script = [[print(jit.version)]]; self.Comp:Execute(lua_script); return Text("Running LuaJIT!")
```



## Lua Modules Usage

A Lua Module can be accessed in an expression. Lua Modules allow you to reuse common utility functions in a shared lua script file. This cuts down on code duplication. The Reactor package manager's LuaModules PathMap folder location is: "`Reactor:/Deploy/Modules/Lua/`"

Note: The example expression below uses a Lua Module that is provided by the Reactor Package Manager atom package called the "Vonk Data Nodes". What is returned in an XML document as a block of text.

```lua
:local url = "https://www.steakunderwater.com/wesuckless/feed"; local textutils = self and require("vtextutils") or nil; return Text(textutils.read_url(url))
```

The Reactor installer can be live downloaded and run from an expression using: 
```lua
:local url = "https://gitlab.com/WeSuckLess/Reactor/-/raw/master/Reactor-Installer.lua?inline=false"; local textutils = self and require("vtextutils") or nil; reactor_script_str = textutils.read_url(url); self.Comp:Execute(reactor_script_str); return Text("Running the Reactor Installer!")
```



## UUID

The current Fusion program's UUID value can be accessed in an expression using:
```lua
:return Text(bmd.getappuuid())
```

The result is:
`9ec0e65e-9137-4552-90cc-7ef9a9cd91b9`



## Zero Padding a Number

If you need to add leading zero digit based frame padding to a number, this can be achieved in an expression using:
```lua
:local num = 120;local padding = 4;return Text(string.format([[%0]] .. tostring(padding or 4) .. [[d]], tonumber(num)))
```


## Fusion Comp Name

The current Fusion Studio Standalone composite name can be accessed in an expression using:
```lua
:return Text(self.Comp.Name)
```



## Fusion Comp Filename

The current Fusion Studio Standalone composite filename can be accessed in an expression using:
```lua
:return Text(self.Comp.Filename)
```



## Fusion Host Operating System Platform

The LuaJIT interpreter is able to report the current operating system platform in an expression using:
```lua
:return Text(jit.os)
```

The values returned by "jit.os" are typically:
- `jit.os == "Windows"`
-  `jit.os == "Linux"`
- `jit.os == "OSX"`


## Fusion Host CPU Architecture

The LuaJIT interpreter is able to report the current CPU architecture in an expression using:
```lua
:return Text(jit.arch)
```

The values returned by "jit.arch" are typically:

Running on...                       | Value
------------------------------------|----------
Windows x86 32-bit CPU              |  `jit.arch == "x86"`
Intel or AMD64 CPU                  |  `jit.arch == "x64"`
Apple Silicon or Windows on ARM CPU |  `jit.arch == "arm64"`

*Note: A legacy release of eyeon Digital Fusion, like v6.4, is required to see the `x86` arch value*



## Date

The current date can be accessed in an expression using:
Note: Date and Time docs: [https://www.lua.org/pil/22.1.html](https://www.lua.org/pil/22.1.html "Opens in new window")
```lua
:return Text(os.date([[%Y-%m-%d]]) or [[]])
```
or
```lua
:return Text(os.date([[%Y-%m-%d %H.%M.%S]]) or [[]])
```


## Clipboard Contents

The current copy/paste clipboard contents can be accessed in an expression using:
```lua
:return Text(bmd.getclipboard() or [[]])
```