# [MultiButtonEmulation.fuse](MultiButtonEmulation.fuse) (study)

There is a problem with the [MultiButtonControl](MultiButtonCOntrol.md) not working.

Within this Fuse there is a "simulated" MultiButton. It shows that there is still some button functionality behind the MultiButtonControl as in particular the `MBTNC_Type = 'Toggle'` has an effect here - or would that MBTNC option work on a normal ButtonControl too (to be tested)?!? All in all it allows a MultiButton kind of control, but comes at an implementation effort that makes it impractical.

Notes for the "simluated" MultiButtons:
- If `MBTNC_ShowName` is `true`, then it is the Label of the button with an `IC_ControlID` of 0 that is shown.
- If some other buttons in the group have `MBTNC_ShowName=false` set, then at some point the label is not shown anymore; so it's better to set it to `true` for all of them to be on the safe side.

What you can use it for:
- Nothing, it's just example code and not an actually useable fuse ... so don't use the fuse, but look into its code if you search for something like this, so:
- If you really need a MultiButtonControl kind of functionality, then copy'n'pasting some of this fuse's source code might be a good starting point for your own experiments
