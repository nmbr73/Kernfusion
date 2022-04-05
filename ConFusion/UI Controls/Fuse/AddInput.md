The `AddInput()` function is used in the [[Create()|Fuse:Create()]] callback to add inputs (controls) to the Fuse. An input can be one of several control types that are shown in the tools inspector pane, or an image type input which appears on the Fuses node.

```lua
self::AddInput(label, identifier, attributes)
```

with 
* label: a string that is typically shown on the left  (e.g. for sliders) or within (e.g. for buttons) of the control.
* identifier: a string used for scripting, i.e. when saving the controls value to a lua file
* attributes: a table with attributes determining the controls type and properties

# Attributes

## Mandatory Attribute

* `INPID_InputControl` ist a string specifying the type of control to add and must be one of the following:
  * ButtonControl
  * CheckboxControl
  * ColorControl
  * ComboControl
  * ComboIDControl
  * FileControl
  * FontFileControl
  * GradientControl
  * LabelControl
  * MultiButtonControl
  * MultiButtonIDControl
  * OffsetControl
  * RangeControl
  * ScrewControl
  * SliderControl
  * TextEditControl

## Common Attributes

* `LINKID_DataType` as string that specifies the data type of the control. Set this according to the INPID_InputControl used; e.g., Number for a SliderControl, or Text for a FileControl. Use Image to specify an image input channel for the tool.
  * `FuID`
  * `Gradient`
  * `Image`
  * `Number`
  * `Particles`
  * `Point`
  * `Text`
* LINK_Main

* `ICD_Width`(float): The width of the control; e.g. a 0.5 makes the control half of its normal size.


## Input Control Types 

When calling `AddInput()` use one of the following for `INPID_InputControl`:



### ComboControl

Creates a drop down menu. Selected entry is represented by a number (starting with 0 for the first entry).

#### Attributes

* `CC_LabelPosition` ("Vertical"|"Horizontal"): Position of the label for this control (default is "Horizontal"). 
* `CCS_AddString`

#### Example

```lua
InCombo = self:AddInput("Select one", "MySelectOneCombo", {
  INPID_InputControl = "ComboControl",
  LINKID_DataType = "Number", 
  INP_Integer = true, -- 0..4 for the selected item
  INP_Default = 2, -- third item preselected
  { CCS_AddString = "ONE" },
  { CCS_AddString = "2" },
  { CCS_AddString = "III" },
  { CCS_AddString = "four" },
  { CCS_AddString = "V" },
  CC_LabelPosition = "Vertical", -- put the label on top of the control
  })
```


## Preview Control Types

Values for `INPID_PreviewControl` are:

* AngleControl
* CrosshairControl
* ImgOverlayControl
* RectangleControl
* PointControl
* TransformControl

