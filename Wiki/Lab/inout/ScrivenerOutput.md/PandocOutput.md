Here we go … This is a (intentionally) small Scrivener document to
examine the different formattings and output formats. See Some Examples
to test Styles, Export, Transformation for standard and custom ‘Style’
examples. In Images, Captions and YouTube Videos I did some different
variants of inserting images. Some of the articles have ‘labels’ - this
can help when filtering for the ‘compile’ maybe … but I did this mainly
to see if I can find the lables in the data to use them as metadata
(e.g. as tags in a YAML front matter?!)

Some Examples to test Styles, Export, Transformation This is to check
what happens to self defined styles in the output. That’s to see how
some more semantic markup of the text could be realised and how to
preserve the information for output formatting. Some Lua code as a
single `Code Block (Lua)`:

~~~ lua
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
~~~

And again some Lua code, but this time written down in the corresponding
style instead of selection the text and then setting the style. This way
the “next” option of the Style should take effect and question is, if
this leads to separate paragraphs of the same style or something else.

~~~ lua
-- The famous words:
print("Hello World!")
~~~

… and we are back to normal. And here comes the same for some Python
code:

~~~ python
# This program adds two numbers

num1 = 1.5
num2 = 6.3

# Add two numbers
sum = num1 + num2

# Display the sum
print('The sum of {0} and {1} is {2}'.format(num1, num2, sum))
~~~

And some code block in the default style - so not specified any further:
The sum of 1.5 and 6.3 is 7.8 … Probably there are ways to make these
code blocks look nicer in Scrivener to help with the authoring in the
app - but that’s not the purpose here and should (hopefully) not change
anything for the exports.

First: This one does not have any headline or title. I might use the
“file name” here and then replace all level n headings with n+1 in the
post process?!?

A plain YT link: https://www.youtube.com/watch?v=iEIFl6gp58Q Just
another paragraph. A link IN a caption:
https://www.youtube.com/watch?v=iEIFl6gp58Q

Image link: ![[image314.png]] Image link with caption: ![[image314.png]]
Image with no link … but I don’t see where the center formatting comes
from: ![[image261.png]] Image with no link but a caption:
![[Reactor-InstallerluaIconImageExample.png]] …

The original name of the `Reactor-Installer.lua` image was “image261”;
via “Scale image” context menu it has been scaled and renamed to
“Reactor-Installer.lua Icon Image Example” here:

![[Reactor-InstallerluaIconImageExample.png]]

Did a “Save As Picture …” into the .scriv package folder - makes little
sense: ![[image261.png]] An image inserted via Drag’n’Drop:
![[SamLowry.png]] … interesting to see that the filename is preserved!

Text

… the end :-P
