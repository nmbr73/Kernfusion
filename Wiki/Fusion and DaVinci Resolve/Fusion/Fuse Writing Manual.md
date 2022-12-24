A [[Fuse]] is a script plug-in for Fusion that is written in [[Lua]] language.

Fuses are not compiled plug-ins, and can also work in the free version of Fusion.

Developers do not need to obtain the Fusion SDK in order to write fuses.

This is a guide on how to write your own Fuses.

## Getting Started
Fuses are standard text file that contain Lua code that does the operation that the fuse is meant to do.

The text file has to be named with a .fuse file extension in order for Fusion to recognize it as a tool.

Fuse files to be placed into a special folder so that Fusion can load the Fuse when you start.

In order to know which folder the fuses need to be placed in, copy and paste the following script into your Fusion console and hit Enter on your keyboard.
 bmd.openfileexternal("Open", comp:MapPath("Fuses:/"))
This script will open the folder where you should keep your fuses. Once the folder is open, you can add it to your quick access so that you can find it easily.

## Registering a Fuse

...