Creating a Fuse is done by implementing different callback functions, which in this context are also known as event functions.

# Event Functions

## `FuRegisterClass( string <NAME>, CT_Tool, table <ATTRS>)`

...

If you use a non-existing Icon ID for `REGS_IconID`, then the first three characters of the `REGS_OpIconString` are used as an Icon in the 'Effects' Pane and the 'Select Tool' window. But it's in green instead of the usual gray and the icon is not shown in the about dialog or if you enable 'Show Tile Picture' in the composition.

Works:
- Icons.Tools.Icons.Loader

Does not work:
- Icons.Tools.Icons.Layout


## `Create()`

...

## `Process(req)`

Can't access global variables created in OnAddToFlow(), OnConnected() or NotifyChanged().

## `OnAddToFlow()`

Called after the Fuse has been added. All Inputs have already been created and can be modified (e.g. by setting MinAllowed and MaxAllowed depending on the current composition's frame range).

## `OnConnected(input, old, new)`

Gets called whenever a connection is made to the inputs, either by connecting images to an image input or by animating a number input. Also called when this connection is removed or when this change in connections happens anywhere upstream of this Fuse.


## `CheckRequest(req)`

Called once or multiple times before Process(), depending on the input priority levels of this Fuse.

##  `NotifyChanged(inp, param, time)`

Handle changes to an input.


## `PreCalcProcess(req)`

Not called if REG_NoPreCalcProcess is true.


# Sources

- [Creating Fuses](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index3e69.html?title=Eyeon:Script/Reference/Applications/Fuse/Creating_Fuses) articel on VFXPedia.
- [Debug fuse](https://www.steakunderwater.com/VFXPedia/96.0.243.189/images/Debug.Fuse) by Stefan Ihringer, stefan@bildfehler.de
