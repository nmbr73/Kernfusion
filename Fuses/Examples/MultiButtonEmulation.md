# MultiButtonControl

There is a problem with the [MultiButtonControl](MultiButtonCOntrol.md) not working.


## Example: [MultiButtonEmulation.fuse](MultiButtonEmulation.fuse)

Within this Fuse there is a "simulated" MultiButton. It shows that there is still some button functionality behind the MultiButtonControl as in particular the `MBTNC_Type = 'Toggle'` has an effect here - or would that MBTNC option work on a normal ButtonControl too (to be tested)?!? All in all it allows a MultiButton kind of control, but comes at quite some implementation effort making it pretty impractical.

Notes for the "simluated" MultiButtons:
- If `MBTNC_ShowName` is `true`, then it is the Lable of the button with an `IC_ControlID` of 0 that is shown.
- If some other buttons in the group have `MBTNC_ShowName=false` set, then at some point the label is not shown anymore; so it's better to set it to `true` for all of them to be on the safe side.
