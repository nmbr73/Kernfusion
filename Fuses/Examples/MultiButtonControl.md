# MultiButtonControl

> **Note:** The MultiButtonControl (see [VFXPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4dea.html?title=Eyeon:Script/Reference/Applications/Fuse/Classes/Input/MultiButtonControl); usage example in [OpenCL Fuses: Position and Time](http://www.bryanray.name/wordpress/opencl-fuses-position-and-time/)) does not work as expected since quite a while. This [bug with adding a control to a Fusion tool](https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=72828&p=405807&hilit=MultiButton#p405699) when it comes to multi buttons has been reported on the BMD forum in 2018 already, as well as it had been put on the [The most friendly feature request list for Fusion16](https://forum.blackmagicdesign.com/viewtopic.php?f=22&t=89684&p=500691&hilit=MultiButton#p500691). It's already been a pity that things like 'TriState' have never been implemented and adding icons is restricted to the C++ API, but with this bug the MultiButtonControl looks like just an ordinary ComboBoxControl. See the [MultiButtonEmulation](MultiButtonEmulation.md) for a pretty useless workaround.


A multi button control (`INPID_InputControl='MultiButtonControl'`) displays one or more *connected* buttons. The actual buttons are added to the control by specifying a table with each entry containing `MBTNC_AddButton` items. Value of the control is the clicked button's number (starting at 0).

```lua
  MyMultiButton = self:AddInput("A Multi Button", "mbtn", {

    LINKID_DataType     = "Number",
    INPID_InputControl  = "MultiButtonControl",
    INP_Default         = 1,

    MBTNC_Type          = "Normal", -- Normal|Toggle|TriState
    MBTNC_StretchToFit  = true,

    { MBTNC_AddButton = "Archibald",  },
    { MBTNC_AddButton = "Lowry",      },
    { MBTNC_AddButton = "Buttle",     },
  })
```


Besides of the [General Attributes](GeneralAttributes.md), there are the following control specific properties:

- **MBTNC_ButtonHeight** (int) Hight of the button in pixels (default is 26).
- **MBTNC_StretchToFit** (bool) Set to `true` to stretch the buttons equally across the full control's width. Does only work if MBTNCD_ButtonWidth has not been set.
- **MBTNC_ShowName** (bool) Indicates if to show or hide the control's name as a label.
- **MBTNC_NoIconScaling** (bool) Disable scaling of the icon to the full button size.
- **MBTNC_Type** (string) Set to "Normal", "Toggle" or "TriState".
  - *Normal* acts like a normal button control (value is 1 when button pressed, 0 when released).
  - *Toggle* makes the button change it's state back with a second click instead of a press and release.
  - *TriState* exist, but does behave exactly the same as 'Normal'
- **MBTNC_Align** (string) Set to "Center", "Left" or "Right".
- **MBTNC_ShowBasicButton** (bool) ... is maybe just an old, today unused option?

And for the buttons added to the control there are the following additional attributes:

- **MBTNC_AddButton** (string) Label of the button.
- **MBTNCD_ButtonWidth** (float) Button widths from 0.0 (hidden) and 1.0 (full width; do not try to make it any wider). In contrast to the control's *ICD_Width* this is the width of the button within this outer control.  If not set, then the buttons should auto-size to their label width.
- **MBTNC_ShowLabel** (bool) Enable/disable button's text display.
- **MBTNC_ShowIcon** (bool) Enable/disable button's icon display.
- **MBTNCS_ToolTip** (string) Tooltip text.


> Note: The attributes related to icons (MBTNC_NoIconScaling, MBTNC_ShowLabel and MBTNC_ShowIcon) are probably pretty useless, as a Fuse can't add icons for a button (in contrast to the internal C++ API). The TriState option for MBTNC_Type has never been implemented.

> Todo: MBTNC_ShowBasicButton is said to have no effect, or to depend on the skin, or to maybe have some effect by hiding the button but not its label ... have to try that out in a current Fusion version.



## Example: [MultiButtonControl.fuse](MultiButtonControl.fuse)

This [MultiButtonControl.fuse](MultiButtonControl.fuse) shows the issue of MultiButtonControls being shown as ComboBoxes (as least it shows it as long as the issue exists). Not only do MultiButtons provide a better look and feel for some purposes, but they require less clicks and in particular allow not only for a 'Normal' but also a 'Toggle' type (and in theory a 'TriState' type; but as far as I know the QPushbutton does not provide that, so it's probably very unlikely that we'd get a TriState some day).

See the [MultiButtonEmulation](MultiButtonEmulation.md) for a (bad) example how one could mimic a multi button's behavior (showing that there still is some dedicated implementation behind the MultiButtonControl).

What you can use it for:
- Nothing, it's just example code and not an actually useable fuse ... use it to see different attempts to create a MultiButtonControl and maybe use it as a starting point for your own experiments to do so
