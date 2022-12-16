---
title: Kernfusion  
author:
---

Here we go ... (H1)
This is a (intentionally) small Scrivener document to examine the different formattings and output formats.

See Some Examples to test Styles, Export, Transformation for standard and custom 'Style' examples.
In Images, Captions and YouTube Videos I did some different variants of inserting images.


Some of the articles have 'labels' - this can help when filtering for the 'compile' maybe ... but I did this mainly to see if I can find these labels in the data to use them as metadata (e.g. as tags in a YAML front matter?!).

Standard (H2)
This is a `Code Span` (Character Style), an Emphasis (Character Style), some Bold (Format), some Italics (Format),  Underlined (Format), Highlight (yellow) (Format), Highlight (green) (Format), a 
Now comes a BlockQuote
> Blockquote (Paragraph Style)
> ... second blockquote paragraph
Next is a Code Block
	Code Block (Paragraph Style)
	new line with that Code Block
	... second codeblock paragraph

And now
A Verse
With tow lines
And next
An attribution
A Title
Which makes little sense here

Another Title
Which makes even less sense ;-)

Some Examples to test Styles, Export, Transformation
This is to check what happens to self defined styles in the output. That's to see how some more semantic markup of the text could be realised and how to preserve the information for output formatting.
Some Lua code as a single `Code Block (Lua)`:


```lua
-- defines a factorial function
function fact (n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end

print("enter a number:")
a = io.read("*number")        -- read a number
print(fact(a))
```

And again some Lua code, but this time written down in the corresponding style instead of selection the text and then setting the style. This way the "next" option of the Style should take effect and question is, if this leads to separate paragraphs of the same style or something else.

```lua
-- The famous words:
print("Hello World!")
```

... and we are back to normal.
And here comes the same for some Python code:

```python
# This program adds two numbers

num1 = 1.5
num2 = 6.3

# Add two numbers
sum = num1 + num2

# Display the sum
print('The sum of {0} and {1} is {2}'.format(num1, num2, sum))
```

And some code block in the default style - so not specified any further:
	The sum of 1.5 and 6.3 is 7.8
...
Probably there are ways to make these code blocks look nicer in Scrivener to help with the authoring in the app - but that's not the purpose here and should (hopefully) not change anything for the exports. 

First: This one does not have any headline or title. I might use the "file name" here and then replace all level n headings with n+1 in the post process?!?

A plain YT link: https://www.youtube.com/watch?v=iEIFl6gp58Q
Just another paragraph.
A link IN a caption: https://www.youtube.com/watch?v=iEIFl6gp58Q

Image link:
![][image314]
Image link with caption:
![Reactor is released - GET IT NOW!][image314-1]
Image with no link ... but I don't see where the center formatting comes from:
![][image261]
Image with no link but a caption:
![Reactor-Installer.lua][Reactor-InstallerluaIconImageExample]
...

The original name of the `Reactor-Installer.lua` image was "image261"; via "Scale image" context menu it has been scaled and renamed to "Reactor-Installer.lua Icon Image Example" here:

![][Reactor-InstallerluaIconImageExample-1]

Did a "Save As Picture ..." into the .scriv package folder - makes little sense:
![][image261-1]
An image inserted via Drag'n'Drop:
![][SamLowry]
... interesting to see that the filename is preserved!




Text

Here is a Title
... the end :-P

Now this is ... seems that internal links are not exportred in markdown?!?

[image314]: image314.png {width=261 height=248}

[image314-1]: image314.png {width=261 height=248}

[image261]: image261.png {width=82 height=101}

[Reactor-InstallerluaIconImageExample]: Reactor-InstallerluaIconImageExample.png {width=82 height=101}

[Reactor-InstallerluaIconImageExample-1]: Reactor-InstallerluaIconImageExample.png {width=41 height=50}

[image261-1]: image261.png {width=82 height=101}

[SamLowry]: SamLowry.png {width=397 height=430}