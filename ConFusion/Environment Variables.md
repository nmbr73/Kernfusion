In Lua you can access system ENV variables via:
```lua
 os.getenv("NAME")
````
You can use ...
```lua
 OBJECT:SetPrefs('Global.EnvironmentVars.NAME',VALUE)
 OBJECT:GetPrefs('Global.EnvironmentVars.NAME')
```
... to set, resp. get preferences.

Where OBJECT is ...
```lua
 GetPrefs('Global.EnvironmentVars.NAME')                         -- ...
 app:GetPrefs('Global.EnvironmentVars.NAME')                     -- in a Fusion Script
 comp:GetPrefs('Global.EnvironmentVars.NAME')                    -- ...
 composition:GetPrefs('Global.EnvironmentVars.NAME')             -- ...
 Comp():GetPrefs('Global.EnvironmentVars.NAME')                  -- ...
 fusion:GetCurrentComp():GetPrefs('Global.EnvironmentVars.NAME') -- ...
 fusion:GetPrefs('Global.EnvironmentVars.NAME')                  -- ...
 self.Comp:GetPrefs('Global.EnvironmentVars.NAME')               -- in the Process() callback of a Fuse
```
... see [[Global Variables and Scopes]]

-----
See also:
- [[Config]]