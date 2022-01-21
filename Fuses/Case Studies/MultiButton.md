# MultiButton

The MultiButtonControl (see [VFXPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4dea.html?title=Eyeon:Script/Reference/Applications/Fuse/Classes/Input/MultiButtonControl); usage example in [OpenCL Fuses: Position and Time](http://www.bryanray.name/wordpress/opencl-fuses-position-and-time/) does not work as expected since quite a while. This [bug with adding a control to a Fusion tool](https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=72828&p=405807&hilit=MultiButton#p405699) when it comes to multi buttons has been reported on the BMD forum in 2018 already, as well as it had been put on the [The most friendly feature request list for Fusion16](https://forum.blackmagicdesign.com/viewtopic.php?f=22&t=89684&p=500691&hilit=MultiButton#p500691).

This fuse shows the issue of MultiButtonControls beign shown as ComboBoxes (as least it shows it as long as the issue exists). Not only do MultiButtons provide a better look and feel for some purposes, but they require less clicks an in particular allow for 'Normal', 'TriState' and 'Toggle' type.

Within this Fuse there is a "simulated" MultiButton. It shows that there is still some button functionality behind the MultiButtonControl as in particular the `MBTNC_Type = 'Toggle'` has an effect here - or would that MBTNC option work on a normal ButtonControl?!? All in all it allows a MultiButton kind of control, but come at quite some implementation effort making it impractical.

Notes for the "simluated" MultiButtons:
- If `MBTNC_ShowName` is `true`, then it is the Lable of the button with `IC_ControlID` that is shown.
- If some other buttons in the group have `MBTNC_ShowName=false` set, then at some point the label is not shown anymore; so it's better to set it to `true` for all of them to be on the safe side.
