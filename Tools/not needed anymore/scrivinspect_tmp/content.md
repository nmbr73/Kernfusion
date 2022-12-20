\<\$ScrKeepWithNext\>\<\$Scr_H::1\>\<\$Scr_Ps::0\>**Some Examples to
test Styles, Export, Transformation**\
\<!\$Scr_H::1\>\<!\$Scr_Ps::0\>This is to check what happens to self
defined styles in the output. That's to see how some more
\<\$Scr_Cs::4\>*semantic markup*\<!\$Scr_Cs::4\> of the text could be
realised and how to preserve the information for output formatting.\
Some Lua code as a single \<\$Scr_Cs::5\>Code Block
(Lua)\<!\$Scr_Cs::5\>:\
\
\<\$Scr_Ps::1\>\-- defines a factorial function\
function fact (n)\
if n == 0 then\
return 1\
else\
return n \* fact(n-1)\
end\
end\
\
print(\"enter a number:\")\
a = io.read(\"\*number\") \-- read a number\
print(fact(a))\
\<!\$Scr_Ps::1\>And again some Lua code, but this time written down in
the corresponding style instead of selection the text and then setting
the style. This way the "next" option of the Style should take effect
and question is, if this leads to separate paragraphs of the same style
or something else.\
\<\$Scr_Ps::1\>\-- The famous words:\
print("Hello World!")\
\<!\$Scr_Ps::1\>... and we are back to normal.\
And here comes the same for some Python code:\
\<\$Scr_Ps::2\># This program adds two numbers\
\
num1 = 1.5\
num2 = 6.3\
\
\# Add two numbers\
sum = num1 + num2\
\
\# Display the sum\
print(\'The sum of {0} and {1} is {2}\'.format(num1, num2, sum))\
\<!\$Scr_Ps::2\>And some code block in the default style - so not
specified any further:\
\<\$Scr_Ps::3\>The sum of 1.5 and 6.3 is 7.8\
\<!\$Scr_Ps::3\>...\
Probably there are ways to make these code blocks look nicer in
Scrivener to help with the authoring in the app - but that's not the
purpose here and should (hopefully) not change anything for the exports.
