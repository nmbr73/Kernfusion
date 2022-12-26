---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

Beat

Pulse your animation in sync with the beat of your music

![[image46__fix3.png]]![[image200__fix1.png]]

Color Switcher

A modifier that switches color values

![[image36__fix5.png]]![[image19__fix4.png]]![[image268.png]]

Formula

Text formula allows numeric values to be used within text fields, or combines several texts (such as timecode, flow name, ...)

![[image60__fix3.png]]![[image198__fix1.png]]![[image278__fix1.png]]![[image77__fix2.png]]

From File

Retrieve text from file

![[image159.png]]

Source

The "Source" control allows you to input your data from an external text file, or by entering the content in the "Text" input field on the modifier node itself.

![[image216__fix1.png]]

The "Format" control options are "Each line a frame", "Startframe and text", and "Line on frame".

Line on Frame

Setting the "Format" control to the "Line on Frame" option exposes an additional "Line" slider element which can be used to directly select the exact line number from the text file that is displayed.

![[image63__fix3.png]]

Each line a frame

Setting the "Format" control to the default "Each line a frame" option syncs the line being read from the external text file with the current frame number in the timeline.

![[image191__fix1.png]]

The "Loop" checkbox allows you to replay the contents of the external text file, line by line, once the end of the document is reached.

The "Hold frames" control allows you to delay the start of the text file playback for a user specified amount of frames.

Startframe and text

![[image246__fix1.png]]

Setting the "Format" control to the "Startframe and text" option allows you to customize your timing with very tight precision for pre-defined frame ranges.

Each row in the document starts with either a single frame number, or a frame range written with a dash like "30-60", followed by a whitespace character, then the text to display. To display an initial message for 120 frames, then to display another message for a subsequent 120 frame duration you would write in:

1-120 Hello World!

121-240 To Be Continued...

Juggle

Juggle text (characters, words, lines) around

![[image14__fix6.png]]

The "Juggle Characters" slider can be adjusted from 0 (no effect) to 1.0 (all characters juggled).

If you entered "Hello World" into the "Text" field of the modifier and set the Juggle Characters control to 1.0 you would get a result of "llroeHdl Wo".

Random

Random Number

![[image237__fix1.png]]

The Random Modifier is applied to Number input field based values. The randomized number value is animated across the timeline frame range.

The "Minimum value" control is used to adjust the lowest part of the spline curve generated.

The "Maximum value" control is used to adjust the highest part of the spline curve generated.

If you lift both the minimum and maximum ranges at the same time you can offset the range of values created.

It is also possible to split the min/max value range instead of being 0 to 1 to have a min/max value range of -1 to 1, or -0.5 to 0.5 if you need both negative and positive random numbers generated.

The "Seed" control is used to shift the initial random number starting point. Changing the seed value will result in a different sequence of numbers being generated.

New value for every field/frame

Unchecking the "\[x\] New value for every field/frame" checkbox will display two additional UI elements that provide more control over the frequency of change for the random number generation.

![[image220__fix1.png]]

The additional UI controls are labeled "New value every ... frames", along with an "Interpolation" control.

The "New value every ... frames" control lets you define how fast the random number generator output is refreshed. The control unit of measure is in timeline frames.

The "Interpolation" control options are "Step", "Linear", and "Ease-in, Ease-out".

Step Interpolation

If you were to set the "New value every ... frames" control to 30 (frames), and the "Interpolation" control to "Step", the resulting number output when displayed in the Splines view would have flat plateau like tangents, positioned at random heights:

![[image39__fix3.png]]

Linear Interpolation

Selecting "Linear" interpolation creates a randomized sawtooth like Spline view result:

![[image124__fix1.png]]

Ease-in, Ease-out interpolation

Selecting "Ease-in, Ease-out" interpolation creates a slightly smoothed top and bottom "cap" on the peaks of the randomized sawtooth like Spline view result:

![[image81__fix3.png]]

Random Number Use Cases

The Random number generator is quite versatile. It could help with adding jitter to 2D or 3D transform attributes, or could add an organic feeling of chaos to blurs, glows, exposure, and other filter effects.

This could be the missing element needed to make a more lively lightsaber that pulses over time, or it could add a bit of uniqueness to simulated analog onscreen motion graphics composited onto an old CRT monitor that has characteristics like snow, static, glitching effects and lots of glow/flicker.

Write

Easy writing of text

![[image153__fix1.png]]

The Write modifier acts much like an old VT100 text terminal character generator. This effect will typically be applied on a Text+ node. The font size of the text generated by the Write modifier is inherited from the base "Size" control on the Text+ node.

As you animate the "Write" slider control from 0 to 1, the letters entered in the "Text" field will be printed on screen, one character at a time.

The "Cursor" element is placed to the right of the most recently entered letter.

The "Prefix" element is placed at the start of the line.

If you entered the text "Hello World" in the Write modifier, enabled the "\[x\] Prefix Show" checkbox, and set the "Write" control to 0.45, you would see the output text:

//Hello\_

The Write modifier can be applied to any Text based attributes in Fusion. This includes the Fusion 3D workspace based "Text3D" node, or the 3rd party Vonk "vText" class of nodes like "vTextCreateMultiline".

![[image70__fix3.png]]

![[image195__fix1.png]]