
Note: given a file path in `file` and directory path in `path` the following code ...
```lua
print("fileexists( file ) == ".. (bmd.fileexists( file ) and "true" or "false"))
print("direxists(  file ) == ".. (bmd.direxists(  file ) and "true" or "false"))
print("fileexists( dir  ) == ".. (bmd.fileexists( dir  ) and "true" or "false"))
print("direxists(  dir  ) == ".. (bmd.direxists(  dir  ) and "true" or "false"))
```
... results in ...
```
fileexists( file ) == true
direxists(  file ) == false
fileexists( dir  ) == true
direxists(  dir  ) == true
```
... so you should know: `fileexists` is true, even if the file is actually not a file but a directory.