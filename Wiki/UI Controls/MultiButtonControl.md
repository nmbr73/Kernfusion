

A multi button control (`INPID_InputControl='MultiButtonControl'`) displays one or more *connected* buttons. The actual buttons are added to the control by specifying a table with each entry containing `MBTNC_AddButton` items. Value of the control is the clicked button's number (starting at 0), or in case of multi-select, aka toggle buttons, the buttons' IDs are powers of two and the value when clicked is the bitwise or of the active buttons IDs.

```lua
  MyMultiButton = self:AddInput("A Multi Button", "mbtn", {

--   LINKID_DataType = "FuID",
--   INPID_DefaultID = "Sample",

    LINKID_DataType     = "Number",
    INPID_InputControl  = "MultiButtonControl",
    INP_Default         = 1,

  -- INP_DoNotifyChanged = true,
  -- INP_Integer = false,
  -- IC_NoLabel = true,
  -- IC_NoReset = true,
  -- CC_LabelPosition = "Horizontal",
  -- INP_MaxScale = 1,
  -- INP_Default = 0,
  -- INP_MinScale = 0,
  -- INP_MaxAllowed = 1,
  -- INP_MinAllowed = 0,
  -- LINKS_Name = "Foo"

    MBTNC_Type          = nil, -- nil|Normal|Toggle|TriState
    MBTNC_ForceButtons  = true,
    MBTNC_StretchToFit  = true,

    { MBTNC_AddButton = "Archibald",  },
    { MBTNC_AddButton = "Lowry",      },
    { MBTNC_AddButton = "Buttle",     },

    -- -- { CCS_AddString = "Tuttle" },
    -- -- { CCS_AddString = "Kurzmann" },

  })
```

## Attributes

Besides of the general [AddInput attributes](AddInput_Attributes), there are the following control specific properties:

- *MBTNC_Align* (string) Set to "Center", "Left" or "Right".
- *MBTNC_AlphaSort*
- *MBTNC_ButtonHeight* (int) Hight of the button in pixels (default is 26).
- *MBTNCD_ButtonHeight*
- *MBTNC_ButtonWidth*
- *MBTNCD_ButtonWidth* (float) Button widths from 0.0 (hidden) and 1.0 (full width; do not try to make it any wider). In contrast to the control's *ICD_Width* this is the width of the button within this outer control. If not set, then the buttons auto-size to their label width; but that does look bad because there is no left or right padding. Does nothing if `MBTNC_StretchToFit` is set to `true`.
- *MBTNCD_ColdFromHot_H*
- *MBTNCD_ColdFromHot_L*
- *MBTNCD_ColdFromHot_S*
- *MBTNCD_ColdFromHot_Opacity*
- **MBTNC_ForceButtons**=true can be used with and only with `MBTNC_Type=nil` to have the control actually rendered as buttons and not as a combo box.
- *MBTNC_Height*
- *MBTNC_NoIconScaling* (bool) Disable scaling of the icon to the full button size.
- *MBTNC_Select*
- *MBTNCID_SelectID*
- *MBTNC_SetDisabled*
- *MBTNCS_SetName*
- *MBTNCS_SetToolTip*
- <del>**MBTNC_ShowBasicButton**</del> (bool) is maybe just an old, today unused option? It's said to have no effect, or to depend on the skin, or to maybe have some effect by hiding the button but not its label. But with all my attempts so far I see no difference.
- *MBTNC_ShowName* (bool) Indicates if to show or hide the control's name as a label.
- *MBTNC_StretchToFit* (bool) Set to `true` to stretch the buttons equally across the full control's width. Does only work if MBTNCD_ButtonWidth has not been set.
- *MBTNC_ShowIcon* (bool) Enable/disable button's icon display.
- *MBTNC_ShowLabel* (bool) Enable/disable button's text display.
- *MBTNC_ShowName*
- <del>**MBTNC_ShowToolTip**</del> (bool) Seems to have no effect, neither on control nor on button level.
- *MBTNC_Tab*
- **MBTNC_Type** (string) Set to `"Normal"`, `"Toggle"`, <del>`"TriState"`</del>, or `nil`. Probably `nil` is some MBTNC_Type we don't know actual name for - and this type is the default.
  - <del>**`"TriState"`**</del> exist, but is not implemented. Looks as if it behaves like "Normal", but does i.e. not trigger events for NotifyChanged. So you should definitely not use it.
  - **`"Normal"`** buttons act like a simple button controls. Value is &gt;=1 (so numbering starts at 1) when button pressed, 0 when released. The events get triggered only when the button is release, so in this case you get an event with a value &gt;=1 immediately followed by a second event with the value being 0.
  - **`"Toggle"`** buttons behave like multi select toggle buttons (like a group of checkboxes would do). Activate a button with a click and deactivate it with a second click. Multiple buttons can be active at the same time (activation does not deactivate the others as it is the case with `MBTNC_Type=nil`). The buttons values are powers of two (1,2,4,8, etc). When multiple buttons are selected then the value is the bitwise combination of their values (3, if first and second button are enabled; 5 if the first and the third are enabled, etc). *The toggle is broken in Fusion 17.0 - if behavior is not as expected then you may need to update*
  - **`nil`** buttons behave like single select toggle buttons (like a group of radio buttons would do). A click activates the button and the previously activated button gets deactivated. With the event you get the number of the activated button (counting from 0). The event is triggered on button release only (not on click). There is no additional event triggered for the other button that gets disabled in that moment. Clicking a button that was already active does trigger the activation event as if it was inactive before (so it cannot be determined easily if it was already enabled). This is the exact behavior of a ComboBoxControl - and as long as you don't set `MBTNC_ForceButtons=true` this MultiButtonControl is actually rendered as a ComboBox.
- *MBTNC_Width*

Button level attributes:
- **MBTNC_AddButton** (string) Label of the button.
- **MBTNCS_ToolTip** (string) Tooltip text.
- *MBTNCID_AddID* (string) if `LINKID_DataType` has been set to `"FuID"` then set the ID for this particular button here.


... whereby this list must be split into the control and the particular button related properties!



> Note: The attributes related to icons (MBTNC_NoIconScaling, MBTNC_ShowLabel and MBTNC_ShowIcon) are probably pretty useless, as a Fuse can't add icons for a button (in contrast to the internal C++ API). The TriState option for MBTNC_Type has never been implemented.

> Todo: MBTNC_ShowBasicButton is said to have no effect, or to depend on the skin, or to maybe have some effect by hiding the button but not its label ... have to try that out in a current Fusion version.



## Examples
- [Docs/MultiButtonControl.fuse](https://github.com/nmbr73/Kernfusion/blob/main/Fuses/Docs/MultiButtonControl.fuse)

## Notes

The MultiButtonControl (see [VFXPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4dea.html?title=Eyeon:Script/Reference/Applications/Fuse/Classes/Input/MultiButtonControl); usage example in [OpenCL Fuses: Position and Time](http://www.bryanray.name/wordpress/opencl-fuses-position-and-time/)) does not work as expected since quite a while. This [bug with adding a control to a Fusion tool](https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=72828&p=405807&hilit=MultiButton#p405699) when it comes to multi buttons has been reported on the BMD forum in 2018 already, as well as it had been put on the [The most friendly feature request list for Fusion16](https://forum.blackmagicdesign.com/viewtopic.php?f=22&t=89684&p=500691&hilit=MultiButton#p500691). It's already been a pity that things like 'TriState' have never been implemented and adding icons is restricted to the C++ API, but with this bug the MultiButtonControl looks like just an ordinary ComboBoxControl. The solution to this is pretty simple but not easy to find: you add a `MBTNC_ForceButtons = true` and the options are shown as buttons again.


