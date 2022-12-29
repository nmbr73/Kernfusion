---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

Apple's Compressor program supports command line job submission. This allows for high-quality ProRes 4444XQ video encodes to be done in an automated fashion on a tiny video encoding system like a macMini that could be placed in the corner of a machine room.

Compressor Learning Resources:

-   [Apple \| Compressor](https://www.apple.com/final-cut-pro/compressor/)
-   [Apple \| Compressor 4 \| Shell Commands for Submitting Compressor Jobs](https://help.apple.com/compressor/mac/4.0/en/compressor/usermanual/index.html#chapter=C%26section=1%26tasks=true)

### Image Sequence to Movie Encoding

Image Sequence to Movie Encoding

Almost every macOS based visual effects artist has a copy of Apple Final Cut Pro on their system, along with the Apple Compressor program, regardless of how often they use it.

What you might not have noticed is that Apple Compressor can be used as a standalone tool for batch converting image sequences, like OpenEXR RGBA footage, into a standards compliant ProRes movie output.

When doing the encoding task a key detail is that you need to place one image sequence per folder on your hard disk. Additionally, just to state this one more time since it is important, only have a single image sequence "clip" in that folder so Compressor doesn't get distracted!

Also it is a good idea to start the image sequence at frame 0000.

To encode an image sequence into a movie, start up the Compressor program. Then select the "File \> Add Image Sequence..." menu item.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image106.png]]

You can then adjust the encoding parameters for the current batch job.

If you are doing this operation very often it makes sense to carry along to the next part of this process and automate the task fully with the help of Compressor's command-line interface.

### Compressor Command-Line Usage

Compressor Command-Line Usage

macOS ZSH Shell Syntax:

    "/Applications/Compressor.app/Contents/MacOS/Compressor" -batchname "ProRes Encode" -jobpath "$Home/Desktop/ImageSequence/" -settingpath "Reactor:/Deploy/Bin/compressor/settings/ProRes.cmprstng" -locationpath "$Home/Desktop/ProRes_Encode.mov"

Note: The "`.cmprsrng`" file format is a Compressor exported encoding preset settings file.

### Compressor Python + Command-Line Usage

Compressor Python + Command-Line Usage

Here is an example that shows how a SilhouetteFX program based Apple Compressor command-line job submission operation can be carried out. The details can be found in the [SilhouetteFX-Python-Scripts GitHub repository here](https://github.com/AndrewHazelden/SilhouetteFX-Python-Scripts/blob/master/Scripts/actions/achEncodeMovieProRes.py).